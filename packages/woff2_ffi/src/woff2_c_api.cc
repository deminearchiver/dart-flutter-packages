#include <memory>

#include "../third_party/woff2/include/woff2/decode.h"
#include "../third_party/woff2/include/woff2/encode.h"
#include "../third_party/woff2/include/woff2/output.h"

#include "woff2_c_api.h"

struct woff2_out_t {
  virtual ~woff2_out_t() {}
  virtual woff2::WOFF2Out* impl() = 0;
};

struct woff2_string_out_t : public woff2_out_t {
  std::string buf;
  woff2::WOFF2StringOut out;

  woff2_string_out_t() : out(&buf) {}
  woff2::WOFF2Out* impl() override { return &out; }
};

struct woff2_memory_out_t : public woff2_out_t {
  woff2::WOFF2MemoryOut out;

  woff2_memory_out_t(uint8_t* buf, size_t buf_size) : out(buf, buf_size) {}
  woff2::WOFF2Out* impl() override { return &out; }
};

extern "C" {

size_t woff2_default_max_size(void) {
  return woff2::kDefaultMaxSize;
}

// --- WOFF2Out ---

bool woff2_out_write(woff2_out_t* out, const void* buf, size_t n) {
  if (!out || !out->impl()) return false;
  return out->impl()->Write(buf, n);
}

bool woff2_out_write_at(woff2_out_t* out, const void* buf, size_t offset, size_t n) {
  if (!out || !out->impl()) return false;
  return out->impl()->Write(buf, offset, n);
}

size_t woff2_out_size(woff2_out_t* out) {
  if (!out || !out->impl()) return 0;
  return out->impl()->Size();
}

void woff2_out_destroy(woff2_out_t* out) {
  delete out;
}

// --- WOFF2StringOut ---

woff2_string_out_t* woff2_string_out_create(void) {
  return new woff2_string_out_t();
}

bool woff2_string_out_write(woff2_string_out_t* out, const void* buf, size_t n) {
  if (!out) return false;
  return out->out.Write(buf, n);
}

bool woff2_string_out_write_at(woff2_string_out_t* out, const void* buf, size_t offset, size_t n) {
  if (!out) return false;
  return out->out.Write(buf, offset, n);
}

size_t woff2_string_out_size(woff2_string_out_t* out) {
  if (!out) return 0;
  return out->out.Size();
}

size_t woff2_string_out_max_size(woff2_string_out_t* out) {
  if (!out) return 0;
  return out->out.MaxSize();
}

void woff2_string_out_set_max_size(woff2_string_out_t* out, size_t max_size) {
  if (out) {
    out->out.SetMaxSize(max_size);
  }
}

const uint8_t* woff2_string_out_data(woff2_string_out_t* out) {
  if (!out) return nullptr;
  return reinterpret_cast<const uint8_t*>(out->buf.data());
}

void woff2_string_out_destroy(woff2_string_out_t* out) {
  delete out;
}

// --- WOFF2MemoryOut ---

woff2_memory_out_t* woff2_memory_out_create(uint8_t* buf, size_t buf_size) {
  return new woff2_memory_out_t(buf, buf_size);
}

bool woff2_memory_out_write(woff2_memory_out_t* out, const void* buf, size_t n) {
  if (!out) return false;
  return out->out.Write(buf, n);
}

bool woff2_memory_out_write_at(woff2_memory_out_t* out, const void* buf, size_t offset, size_t n) {
  if (!out) return false;
  return out->out.Write(buf, offset, n);
}

size_t woff2_memory_out_size(woff2_memory_out_t* out) {
  if (!out) return 0;
  return out->out.Size();
}

void woff2_memory_out_destroy(woff2_memory_out_t* out) {
  delete out;
}

// --- Decode ---

size_t woff2_compute_final_size(const uint8_t *data, size_t length) {
  return woff2::ComputeWOFF2FinalSize(data, length);
}

bool woff2_convert_to_ttf(const uint8_t *data, size_t length, woff2_out_t* out) {
  if (!out || !out->impl()) return false;
  return woff2::ConvertWOFF2ToTTF(data, length, out->impl());
}

// --- Encode ---

woff2_params_t woff2_params_create(void) {
  woff2_params_t params;
  params.extended_metadata = "";
  params.brotli_quality = 11;
  params.allow_transforms = true;
  return params;
}

size_t woff2_max_compressed_size(const uint8_t* data, size_t length) {
  return woff2::MaxWOFF2CompressedSize(data, length);
}

size_t woff2_max_compressed_size_with_extended_metadata(const uint8_t* data, size_t length, const char* extended_metadata) {
  std::string meta = extended_metadata ? extended_metadata : "";
  return woff2::MaxWOFF2CompressedSize(data, length, meta);
}

bool woff2_convert_from_ttf(const uint8_t* data, size_t length, uint8_t* result, size_t* result_length) {
  return woff2::ConvertTTFToWOFF2(data, length, result, result_length);
}

bool woff2_convert_from_ttf_with_params(const uint8_t* data, size_t length, uint8_t* result, size_t* result_length, const woff2_params_t* params) {
  woff2::WOFF2Params params_impl;
  if (params) {
    if (params->extended_metadata) {
      params_impl.extended_metadata = params->extended_metadata;
    }
    params_impl.brotli_quality = params->brotli_quality;
    params_impl.allow_transforms = params->allow_transforms;
  }
  return woff2::ConvertTTFToWOFF2(data, length, result, result_length, params_impl);
}

} // extern "C"
