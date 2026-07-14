#ifndef WOFF2_C_API_H_
#define WOFF2_C_API_H_

#include <stddef.h>
#include <stdbool.h>
#include <stdint.h>

#ifndef WOFF2_EXTERN
#define WOFF2_EXTERN extern
#endif

#ifdef __cplusplus
extern "C" {
#endif

// woff2::kDefaultMaxSize

/**
 * Suggested max size for output.
 */
WOFF2_EXTERN size_t woff2_default_max_size();


// woff2::WOFF2Out

typedef struct woff2_out_t woff2_out_t;

WOFF2_EXTERN bool woff2_out_write(
  woff2_out_t* out,
  const void* buf,
  size_t n
);

WOFF2_EXTERN bool woff2_out_write_at(
  woff2_out_t* out,
  const void* buf,
  size_t offset,
  size_t n
);

WOFF2_EXTERN size_t woff2_out_size(
  woff2_out_t* out
);

WOFF2_EXTERN void woff2_out_destroy(
  woff2_out_t* out
);

// woff2::WOFF2StringOut

typedef struct woff2_string_out_t woff2_string_out_t;


WOFF2_EXTERN woff2_string_out_t* woff2_string_out_create(void);

WOFF2_EXTERN bool woff2_string_out_write(
  woff2_string_out_t* out,
  const void* buf,
  size_t n
);

WOFF2_EXTERN bool woff2_string_out_write_at(
  woff2_string_out_t* out,
  const void* buf,
  size_t offset,
  size_t n
);

WOFF2_EXTERN size_t woff2_string_out_size(
  woff2_string_out_t* out
);

WOFF2_EXTERN size_t woff2_string_out_max_size(
  woff2_string_out_t* out
);

WOFF2_EXTERN void woff2_string_out_set_max_size(
  woff2_string_out_t* out,
  size_t max_size
);

WOFF2_EXTERN const uint8_t* woff2_string_out_data(
  woff2_string_out_t* out
);

WOFF2_EXTERN void woff2_string_out_destroy(
  woff2_string_out_t* out
);

// woff2::WOFF2MemoryOut

typedef struct woff2_memory_out_t woff2_memory_out_t;

WOFF2_EXTERN woff2_memory_out_t* woff2_memory_out_create(
  uint8_t* buf,
  size_t buf_size
);

WOFF2_EXTERN bool woff2_memory_out_write(
  woff2_memory_out_t* out,
  const void* buf,
  size_t n
);

WOFF2_EXTERN bool woff2_memory_out_write_at(
  woff2_memory_out_t* out,
  const void* buf,
  size_t offset,
  size_t n
);

WOFF2_EXTERN size_t woff2_memory_out_size(
  woff2_memory_out_t* out
);

WOFF2_EXTERN void woff2_memory_out_destroy(
  woff2_memory_out_t* out
);

// Decode

/**
 * Compute the size of the final uncompressed font, or 0 on error.
 */
WOFF2_EXTERN size_t woff2_compute_final_size(
  const uint8_t *data,
  size_t length
);

/**
 * Decompresses the font into out. Returns true on success.
 * Works even if WOFF2Header totalSfntSize is wrong.
 */
WOFF2_EXTERN bool woff2_convert_to_ttf(
  const uint8_t *data,
  size_t length,
  woff2_out_t* out
);

// Encode

typedef struct woff2_params_t {
  const char* extended_metadata;
  int brotli_quality;
  bool allow_transforms;
} woff2_params_t;

WOFF2_EXTERN woff2_params_t woff2_params_create(void);

/**
 * Returns an upper bound on the size of the compressed file.
 */
WOFF2_EXTERN size_t woff2_max_compressed_size(
  const uint8_t* data,
  size_t length
);

/**
 * Returns an upper bound on the size of the compressed file.
 */
WOFF2_EXTERN size_t woff2_max_compressed_size_with_extended_metadata(
  const uint8_t* data,
  size_t length,
  const char* extended_metadata
);

/**
 * Compresses the font into the target buffer. *result_length should be at least
 * the value returned by MaxWOFF2CompressedSize(), upon return, it is set to the
 * actual compressed size. Returns true on successful compression.
 */
WOFF2_EXTERN bool woff2_convert_from_ttf(
  const uint8_t* data,
  size_t length,
  uint8_t* result,
  size_t* result_length
);

/**
 * Compresses the font into the target buffer. *result_length should be at least
 * the value returned by MaxWOFF2CompressedSize(), upon return, it is set to the
 * actual compressed size. Returns true on successful compression.
 */
WOFF2_EXTERN bool woff2_convert_from_ttf_with_params(
  const uint8_t* data,
  size_t length, uint8_t* result,
  size_t* result_length,
  const woff2_params_t* params
);

#ifdef __cplusplus
}
#endif

#endif /* WOFF2_C_API_H_ */
