#*****************************************************************************#
#    Copyright (C) 2009 Aali132                                               #
#    Copyright (C) 2018 quantumpencil                                         #
#    Copyright (C) 2018 Maxime Bacoux                                         #
#    Copyright (C) 2020 myst6re                                               #
#    Copyright (C) 2020 Chris Rizzitello                                      #
#    Copyright (C) 2020 John Pritchard                                        #
#    Copyright (C) 2021 Julian Xhokaxhiu                                      #
#                                                                             #
#    This file is part of FFNx                                                #
#                                                                             #
#    FFNx is free software: you can redistribute it and/or modify             #
#    it under the terms of the GNU General Public License as published by     #
#    the Free Software Foundation, either version 3 of the License            #
#                                                                             #
#    FFNx is distributed in the hope that it will be useful,                  #
#    but WITHOUT ANY WARRANTY; without even the implied warranty of           #
#    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the            #
#    GNU General Public License for more details.                             #
#*****************************************************************************#

include(FindPackageHandleStandardArgs)

if (NOT WAVPACK_FOUND)
	find_library(
		WAVPACK_LIBRARY
		libwavpack
		PATH_SUFFIXES
		lib
	)

	find_path(
		WAVPACK_INCLUDE_DIR
		wavpack.h
		PATH_SUFFIXES
		include
	)

	add_library(WAVPACK::WAVPACK STATIC IMPORTED)

	set_target_properties(
		WAVPACK::WAVPACK
		PROPERTIES
		IMPORTED_LOCATION
		"${WAVPACK_LIBRARY}"
		INTERFACE_INCLUDE_DIRECTORIES
		"${WAVPACK_INCLUDE_DIR}"
	)

	find_package_handle_standard_args(WAVPACK DEFAULT_MSG WAVPACK_LIBRARY WAVPACK_INCLUDE_DIR)
endif()
