Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 0EEE252A9E
	for <meta-arago@arago-project.org>;
	Thu, 13 Sep 2018 19:31:18 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w8DJVAQc120689
	for <meta-arago@arago-project.org>; Thu, 13 Sep 2018 14:31:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1536867070;
	bh=P6+q+AB1L3n8E+WyOt97BT/Bk4ngsyCSeaJTVQUswEY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=c5WyWfGS8MwI40w1Hqh5wwP97dXCYZBPJLCRIjSlLv3i+XyslzL+dwuLHPjw9vo9v
	LhnuqJN8HQMDH1KXrKuY/LA6cBE1ZocmF6lMsRrAaG6Qep3lQVENrNymqPknDC/9Kc
	66NtLXgS/kVwu9I0uq1etlHipzj7BXhoy83gPQs4=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DJVAav006626
	for <meta-arago@arago-project.org>; Thu, 13 Sep 2018 14:31:10 -0500
Received: from DLEE114.ent.ti.com (157.170.170.25) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Thu, 13 Sep 2018 14:31:11 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Thu, 13 Sep 2018 14:31:10 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w8DJVA4d000426;
	Thu, 13 Sep 2018 14:31:10 -0500
Date: Thu, 13 Sep 2018 15:29:45 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20180913192945.GM12296@beryl>
References: <1536861387-7418-1-git-send-email-j-stiffler@ti.com>
	<1536861387-7418-6-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1536861387-7418-6-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [rocko/master][PATCH v6 5/5] armnn: ARM NN machine learning SDK.
X-BeenThere: meta-arago@arago-project.org
X-Mailman-Version: 2.1.12
Precedence: list
List-Id: Arago metadata layer for TI SDKs - OE-Core/Yocto compatible
	<meta-arago.arago-project.org>
List-Unsubscribe: <http://arago-project.org/cgi-bin/mailman/options/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=unsubscribe>
List-Archive: <http://arago-project.org/pipermail/meta-arago>
List-Post: <mailto:meta-arago@arago-project.org>
List-Help: <mailto:meta-arago-request@arago-project.org?subject=help>
List-Subscribe: <http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago>, 
	<mailto:meta-arago-request@arago-project.org?subject=subscribe>
X-List-Received-Date: Thu, 13 Sep 2018 19:31:19 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Sep 13, 2018 at 01:56:27PM -0400, Jacob Stiffler wrote:
> From: Qin Su <qsu@ti.com>
> 
> Arm NN SDK is a set of open-source Linux software and tools that enables
> machine learning workloads on power-efficient devices. Arm NN takes Caffe,
> TensorFlow network frameworks, translate them to the internal Arm NN
> formatand then, through the Compute Library, deploy them efficiently on
> Cortex-A CPUs.
> 
> Signed-off-by: Qin Su <qsu@ti.com>
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
> Changes from previous versions:
> * Add "_git" suffix to recipe name.
> * Add version.
> * Add branch option for SRC_URI.
> * Remove bash-completion package as the file is not present.
> 
>  .../armnn/0001-stdlib-issue-work-around.patch      | 55 ++++++++++++++++++++++
>  .../0002-enable-use-of-boost-shared-library.patch  | 33 +++++++++++++
>  .../recipes-support/armnn/armnn_git.bb             | 45 ++++++++++++++++++
>  3 files changed, 133 insertions(+)
>  create mode 100755 meta-arago-extras/recipes-support/armnn/armnn/0001-stdlib-issue-work-around.patch
>  create mode 100755 meta-arago-extras/recipes-support/armnn/armnn/0002-enable-use-of-boost-shared-library.patch
>  create mode 100644 meta-arago-extras/recipes-support/armnn/armnn_git.bb
> 
> diff --git a/meta-arago-extras/recipes-support/armnn/armnn/0001-stdlib-issue-work-around.patch b/meta-arago-extras/recipes-support/armnn/armnn/0001-stdlib-issue-work-around.patch
> new file mode 100755
> index 0000000..2619c94
> --- /dev/null
> +++ b/meta-arago-extras/recipes-support/armnn/armnn/0001-stdlib-issue-work-around.patch
> @@ -0,0 +1,55 @@
> +From 3691057b51010c1bd979998c460ad7b43f97496f Mon Sep 17 00:00:00 2001
> +From: Qin Su <qsu@ti.com>
> +Date: Fri, 10 Aug 2018 11:02:14 -0400
> +Subject: [PATCH] stdlib issue work around

Please don't forget to provide Upstream-status: per
https://www.openembedded.org/wiki/Commit_Patch_Message_Guidelines#Patch_Header_Recommendations:_Upstream-Status


> +Signed-off-by: Qin Su <qsu@ti.com>
> +---
> + cmake/GlobalConfig.cmake | 28 ++++++++++++++++++++++++++++
> + 1 file changed, 28 insertions(+)
> + mode change 100644 => 100755 cmake/GlobalConfig.cmake
> +
> +diff --git a/cmake/GlobalConfig.cmake b/cmake/GlobalConfig.cmake
> +old mode 100644
> +new mode 100755
> +index 2dbeada..2b88c16
> +--- a/cmake/GlobalConfig.cmake
> ++++ b/cmake/GlobalConfig.cmake
> +@@ -47,6 +47,34 @@ elseif(${CMAKE_CXX_COMPILER_ID} STREQUAL MSVC)
> +     set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} /EHsc /MP")
> +     add_definitions(-DNOMINMAX=1 -DNO_STRICT=1)
> + endif()
> ++
> ++# Ensure that the default include system directories are added to the list of CMake implicit includes.
> ++# This workarounds an issue that happens when using GCC 6 and using system includes (-isystem).
> ++# For more details check: https://bugs.webkit.org/show_bug.cgi?id=161697
> ++macro(DETERMINE_GCC_SYSTEM_INCLUDE_DIRS _lang _compiler _flags _result)
> ++    file(WRITE "${CMAKE_BINARY_DIR}/CMakeFiles/dummy" "\n")
> ++    separate_arguments(_buildFlags UNIX_COMMAND "${_flags}")
> ++    execute_process(COMMAND ${_compiler} ${_buildFlags} -v -E -x ${_lang} -dD dummy
> ++                    WORKING_DIRECTORY ${CMAKE_BINARY_DIR}/CMakeFiles OUTPUT_QUIET
> ++                    ERROR_VARIABLE _gccOutput)
> ++    file(REMOVE "${CMAKE_BINARY_DIR}/CMakeFiles/dummy")
> ++    if ("${_gccOutput}" MATCHES "> search starts here[^\n]+\n *(.+) *\n *End of (search) list")
> ++        set(${_result} ${CMAKE_MATCH_1})
> ++        string(REPLACE "\n" " " ${_result} "${${_result}}")
> ++        separate_arguments(${_result})
> ++    endif ()
> ++endmacro()
> ++
> ++if (CMAKE_COMPILER_IS_GNUCC)
> ++   DETERMINE_GCC_SYSTEM_INCLUDE_DIRS("c" "${CMAKE_C_COMPILER}" "${CMAKE_C_FLAGS}" SYSTEM_INCLUDE_DIRS)
> ++   set(CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES ${CMAKE_C_IMPLICIT_INCLUDE_DIRECTORIES} ${SYSTEM_INCLUDE_DIRS})
> ++endif ()
> ++
> ++if (CMAKE_COMPILER_IS_GNUCXX)
> ++   DETERMINE_GCC_SYSTEM_INCLUDE_DIRS("c++" "${CMAKE_CXX_COMPILER}" "${CMAKE_CXX_FLAGS}" SYSTEM_INCLUDE_DIRS)
> ++   set(CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES ${CMAKE_CXX_IMPLICIT_INCLUDE_DIRECTORIES} ${SYSTEM_INCLUDE_DIRS})
> ++endif ()
> ++
> + if("${CMAKE_SYSTEM_NAME}" STREQUAL Android)
> +     set(CMAKE_EXE_LINKER_FLAGS "${CMAKE_EXE_LINKER_FLAGS} -llog")
> +     set(CMAKE_SHARED_LINKER_FLAGS "${CMAKE_SHARED_LINKER_FLAGS} -llog")
> +--
> +1.9.1
> +
> diff --git a/meta-arago-extras/recipes-support/armnn/armnn/0002-enable-use-of-boost-shared-library.patch b/meta-arago-extras/recipes-support/armnn/armnn/0002-enable-use-of-boost-shared-library.patch
> new file mode 100755
> index 0000000..ee69a95
> --- /dev/null
> +++ b/meta-arago-extras/recipes-support/armnn/armnn/0002-enable-use-of-boost-shared-library.patch
> @@ -0,0 +1,33 @@
> +From 34a7ec821b11f7bed3dd644bf341cbaf6023516b Mon Sep 17 00:00:00 2001
> +From: Qin Su <qsu@ti.com>
> +Date: Tue, 11 Sep 2018 17:11:07 -0400
> +Subject: [PATCH] enable use of boost shared library

Same here re: Upstream-status:


> +Signed-off-by: Qin Su <qsu@ti.com>
> +---
> + cmake/GlobalConfig.cmake | 6 ++++--
> + 1 file changed, 4 insertions(+), 2 deletions(-)
> + mode change 100644 => 100755 cmake/GlobalConfig.cmake
> +
> +diff --git a/cmake/GlobalConfig.cmake b/cmake/GlobalConfig.cmake
> +old mode 100644
> +new mode 100755
> +index 2dbeada..a5a1113
> +--- a/cmake/GlobalConfig.cmake
> ++++ b/cmake/GlobalConfig.cmake
> +@@ -96,8 +96,10 @@ endif()
> + set(CMAKE_MODULE_PATH ${CMAKE_CURRENT_SOURCE_DIR}/cmake/modules ${CMAKE_MODULE_PATH})
> +
> + # Boost
> +-add_definitions("-DBOOST_ALL_NO_LIB") # Turn off auto-linking as we specify the libs manually
> +-set(Boost_USE_STATIC_LIBS ON)
> ++#add_definitions("-DBOOST_ALL_NO_LIB") # Turn off auto-linking as we specify the libs manually
> ++#set(Boost_USE_STATIC_LIBS ON)
> ++add_definitions(-DBOOST_ALL_DYN_LINK) # use shared library
> ++set(Boost_USE_STATIC_LIBS OFF)
> + find_package(Boost 1.59 REQUIRED COMPONENTS unit_test_framework system filesystem log program_options)
> + include_directories(SYSTEM "${Boost_INCLUDE_DIR}")
> + link_directories(${Boost_LIBRARY_DIR})
> +--
> +1.9.1
> +
> diff --git a/meta-arago-extras/recipes-support/armnn/armnn_git.bb b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
> new file mode 100644
> index 0000000..9eaa727
> --- /dev/null
> +++ b/meta-arago-extras/recipes-support/armnn/armnn_git.bb
> @@ -0,0 +1,45 @@
> +DESCRIPTION = "Linux software and tools to enable machine learning (Caffe/Tensorflow) workloads on power-efficient devices"

Short SUMMARY please.


> +LICENSE = "MIT"
> +LIC_FILES_CHKSUM = "file://LICENSE;md5=3e14a924c16f7d828b8335a59da64074"
> +
> +PV = "20180502"
> +
> +BRANCH = "master"
> +SRCREV = "4c7098bfeab1ffe1cdc77f6c15548d3e73274746"
> +
> +S = "${WORKDIR}/git"
> +
> +inherit cmake
> +
> +SRC_URI = " \
> +    git://github.com/ARM-software/armnn.git;branch=${BRANCH} \
> +    file://0001-stdlib-issue-work-around.patch \
> +    file://0002-enable-use-of-boost-shared-library.patch \
> +"
> +
> +DEPENDS = " \
> +    boost \
> +    protobuf \
> +    stb \
> +    arm-compute-library \
> +    armnn-caffe \
> +    armnn-tensorflow \
> +"
> +
> +EXTRA_OECMAKE=" \
> +    -DBUILD_SHARED_LIBS=ON -DREGISTER_INSTALL_PREFIX=OFF \
> +    -DARMCOMPUTE_ROOT=${STAGING_DIR_HOST}${datadir}/arm-compute-library \
> +    -DARMCOMPUTE_BUILD_DIR=${STAGING_DIR_HOST}${datadir}/arm-compute-library/build \
> +    -DCAFFE_GENERATED_SOURCES=${STAGING_DIR_HOST}${datadir}/armnn-caffe \
> +    -DTF_GENERATED_SOURCES=${STAGING_DIR_HOST}${datadir}/armnn-tensorflow \
> +    -DBUILD_CAFFE_PARSER=1 -DBUILD_TF_PARSER=1 \
> +    -DARMCOMPUTENEON=1 \
> +    -DBUILD_TESTS=1 -DPROFILING=1 \
> +    -DTHIRD_PARTY_INCLUDE_DIRS=${STAGING_DIR_HOST}${includedir} \
> +"
> +
> +CXXFLAGS += "-fopenmp"
> +LIBS += "-larmpl_lp64_mp"
> +
> +FILES_${PN}-dev += "{libdir}/cmake/*"
> +INSANE_SKIP_${PN}-dev = "dev-elf"
> -- 
> 2.7.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

