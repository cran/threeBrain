#' R6 Class - Generate Data Cube Geometry via 3D Volume Texture
#' @author Zhengjia Wang
#' @name DataCubeGeom2
NULL

#' @export
DataCubeGeom2 <- R6::R6Class(
  classname = 'DataCubeGeom2',
  inherit = DataCubeGeom,
  public = list(

    type = 'datacube2',
    clickable = FALSE,
    threshold = 0.6,
    color_format = "RGBAFormat",
    color_map = NULL,

    # if trans_mat is specified, the matrix transfers `trans_space_from` to tkrRAS
    # default is to "model, alternatively `scannerRAS`
    trans_space_from = "model",

    initialize = function(name, value, dim = dim(value),
                          half_size = c(128,128,128),
                          group = GeomGroup$new(name = 'default'),
                          position = c( 0, 0, 0),
                          color_format = c("RGBAFormat", "RedFormat"),
                          cache_file = NULL,
                          layer = 8, digest = TRUE, ...){
      # Make sure value is from 0 to 255
      if(missing(value)){
        super$initialize(name = name, dim = dim, half_size = half_size,
                         group = group, position = position,
                         cache_file = cache_file,
                         layer = layer, digest = digest, ...)
      } else {
        value <- as.integer(value)
        super$initialize(name = name, value = value, dim = dim, half_size = half_size,
                         group = group, position = position,
                         cache_file = cache_file,
                         layer = layer, digest = digest, ...)
      }

      color_format <- match.arg(color_format)
      self$color_format <- color_format

    },

    to_list = function(){
      re <- super$to_list()
      re$threshold <- self$threshold
      re$color_format <- self$color_format
      re$color_map <- self$color_map
      re$isDataCube2 <- self$is_datacube2
      re$trans_space_from <- self$trans_space_from
      re
    }
  ),
  active = list(
    is_datacube2 = function(){ TRUE }
  )
)

VolumeGeom2 <- R6::R6Class(
  classname = "VolumeGeom2",
  inherit = AbstractGeom,
  public = list(
    type = 'datacube2',
    clickable = FALSE,
    threshold = 0.6,
    color_format = "RGBAFormat",
    color_map = NULL,
    trans_space_from = "model",
    initialize = function(
      name, path, group = GeomGroup$new(name = 'default'), layer = 8,
      color_format = c("RGBAFormat", "RedFormat"), ...){

      color_format <- match.arg(color_format)
      abspath <- normalizePath(path, mustWork = TRUE)
      super$initialize(name, position = c(0, 0, 0), layer = layer, ...)
      self$group <- group

      re <- list(
        path = path,
        absolute_path = abspath,
        file_name = filename(abspath),
        is_nifti = TRUE,
        is_new_cache = FALSE,
        is_cache = TRUE
      )
      group$set_group_data("volume_data", value = re, is_cached = TRUE)
      self$color_format <- color_format

    },

    to_list = function(){
      re <- super$to_list()
      re$threshold <- self$threshold
      re$color_format <- self$color_format
      re$isDataCube2 <- self$is_datacube2
      re$isVolumeCube2 <- self$is_volumecube2
      re$color_map <- self$color_map
      re$trans_space_from <- self$trans_space_from
      re
    }
  ),
  active = list(
    is_datacube2 = function(){ TRUE },
    is_volumecube2 = function(){ TRUE }
  )
)
