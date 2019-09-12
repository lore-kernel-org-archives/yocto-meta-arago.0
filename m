Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.64])
	by arago-project.org (Postfix) with ESMTPS id 5CEEE52970
	for <meta-arago@arago-project.org>;
	Thu, 12 Sep 2019 15:39:57 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id A1E0240BF9;
	Thu, 12 Sep 2019 15:38:51 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo14-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id tNPT2Wk9m3Go; Thu, 12 Sep 2019 15:38:51 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-86-127.washdc.fios.verizon.net
	[100.15.86.127])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id 78A6D40C19;
	Thu, 12 Sep 2019 15:38:47 +0000 (UTC)
Received: from gimli.denix (unknown [192.168.30.6])
	by mail.denix.org (Postfix) with ESMTP id 58F5817420B;
	Thu, 12 Sep 2019 11:38:44 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Thu, 12 Sep 2019 11:38:24 -0400
Message-Id: <1568302717-46518-20-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
In-Reply-To: <1568302717-46518-1-git-send-email-denys@ti.com>
References: <1568302717-46518-1-git-send-email-denys@ti.com>
Subject: [master][PATCH 19/32] python-numpy: overlay last version compatible with python2
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
X-List-Received-Date: Thu, 12 Sep 2019 15:40:14 -0000

Required for our old version of opencl.

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 ...h-usr-and-so-on-for-libraries-by-default-.patch |  77 ++++++++++++
 .../files/0001-npy_cpu-Add-riscv-support.patch     |  24 ++++
 .../python-numpy/files/aarch64/_numpyconfig.h      |  32 +++++
 .../python-numpy/files/aarch64/config.h            | 139 +++++++++++++++++++++
 .../python-numpy/files/arm/config.h                |  21 ++++
 .../python-numpy/files/arm/numpyconfig.h           |  17 +++
 .../python-numpy/files/armeb/config.h              |  21 ++++
 .../python-numpy/files/armeb/numpyconfig.h         |  17 +++
 .../files/mipsarchn32eb/_numpyconfig.h             |  31 +++++
 .../python-numpy/files/mipsarchn32eb/config.h      | 139 +++++++++++++++++++++
 .../files/mipsarchn32el/_numpyconfig.h             |  31 +++++
 .../python-numpy/files/mipsarchn32el/config.h      | 138 ++++++++++++++++++++
 .../files/mipsarchn64eb/_numpyconfig.h             |  32 +++++
 .../python-numpy/files/mipsarchn64eb/config.h      | 139 +++++++++++++++++++++
 .../files/mipsarchn64el/_numpyconfig.h             |  32 +++++
 .../python-numpy/files/mipsarchn64el/config.h      | 138 ++++++++++++++++++++
 .../files/mipsarcho32eb/_numpyconfig.h             |  32 +++++
 .../python-numpy/files/mipsarcho32eb/config.h      | 139 +++++++++++++++++++++
 .../python-numpy/files/mipsarcho32el/config.h      |  21 ++++
 .../python-numpy/files/mipsarcho32el/numpyconfig.h |  18 +++
 .../python-numpy/files/powerpc/_numpyconfig.h      |  32 +++++
 .../python-numpy/files/powerpc/config.h            | 139 +++++++++++++++++++++
 .../python-numpy/files/powerpc64/_numpyconfig.h    |  32 +++++
 .../python-numpy/files/powerpc64/config.h          | 139 +++++++++++++++++++++
 .../python-numpy/files/riscv64/_numpyconfig.h      |  32 +++++
 .../python-numpy/files/riscv64/config.h            | 139 +++++++++++++++++++++
 .../python-numpy/files/x86-64/_numpyconfig.h       |  32 +++++
 .../python-numpy/files/x86-64/config.h             | 139 +++++++++++++++++++++
 .../python-numpy/files/x86/config.h                | 108 ++++++++++++++++
 .../python-numpy/files/x86/numpyconfig.h           |  24 ++++
 .../recipes-devtools/python-numpy/python-numpy.inc | 116 +++++++++++++++++
 .../python-numpy/python-numpy_1.16.3.bb            |  10 ++
 .../python-numpy/python3-numpy_1.16.3.bb           |   3 +
 33 files changed, 2183 insertions(+)
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/0001-npy_cpu-Add-riscv-support.patch
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/aarch64/_numpyconfig.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/aarch64/config.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/arm/config.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/arm/numpyconfig.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/armeb/config.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/armeb/numpyconfig.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/mipsarchn32eb/_numpyconfig.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/mipsarchn32eb/config.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/mipsarchn32el/_numpyconfig.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/mipsarchn32el/config.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/mipsarchn64eb/_numpyconfig.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/mipsarchn64eb/config.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/mipsarchn64el/_numpyconfig.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/mipsarchn64el/config.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/mipsarcho32eb/_numpyconfig.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/mipsarcho32eb/config.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/mipsarcho32el/config.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/mipsarcho32el/numpyconfig.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/powerpc/_numpyconfig.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/powerpc/config.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/powerpc64/_numpyconfig.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/powerpc64/config.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/riscv64/_numpyconfig.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/riscv64/config.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/x86-64/_numpyconfig.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/x86-64/config.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/x86/config.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/files/x86/numpyconfig.h
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/python-numpy.inc
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/python-numpy_1.16.3.bb
 create mode 100644 meta-arago-distro/recipes-devtools/python-numpy/python3-numpy_1.16.3.bb

diff --git a/meta-arago-distro/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch b/meta-arago-distro/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
new file mode 100644
index 0000000..8fe0d1a
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/python-numpy/files/0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch
@@ -0,0 +1,77 @@
+From c14554c7e2fff8dd559dfb41e7dd11392c6f85e3 Mon Sep 17 00:00:00 2001
+From: Alexander Kanavin <alex.kanavin@gmail.com>
+Date: Thu, 10 Dec 2015 13:20:30 +0200
+Subject: [PATCH] Don't search /usr and so on for libraries by default to
+
+ avoid host contamination.
+
+Upstream-Status: Inappropriate (As the code stands, this is a hack)
+Signed-off-by: Ross Burton <ross.burton@intel.com>
+Signed-off-by: Alexander Kanavin <alex.kanavin@gmail.com>
+
+---
+ numpy/distutils/system_info.py | 50 ++++------------------------------
+ 1 file changed, 6 insertions(+), 44 deletions(-)
+
+diff --git a/numpy/distutils/system_info.py b/numpy/distutils/system_info.py
+index 2424943..bf56a6d 100644
+--- a/numpy/distutils/system_info.py
++++ b/numpy/distutils/system_info.py
+@@ -274,51 +274,13 @@ if sys.platform == 'win32':
+             add_system_root(os.path.join(conda_dir, 'Library'))
+ 
+ else:
+-    default_lib_dirs = libpaths(['/usr/local/lib', '/opt/lib', '/usr/lib',
+-                                 '/opt/local/lib', '/sw/lib'], platform_bits)
+     default_runtime_dirs = []
+-    default_include_dirs = ['/usr/local/include',
+-                            '/opt/include', '/usr/include',
+-                            # path of umfpack under macports
+-                            '/opt/local/include/ufsparse',
+-                            '/opt/local/include', '/sw/include',
+-                            '/usr/include/suitesparse']
+-    default_src_dirs = ['.', '/usr/local/src', '/opt/src', '/sw/src']
+-
+-    default_x11_lib_dirs = libpaths(['/usr/X11R6/lib', '/usr/X11/lib',
+-                                     '/usr/lib'], platform_bits)
+-    default_x11_include_dirs = ['/usr/X11R6/include', '/usr/X11/include',
+-                                '/usr/include']
+-
+-    if os.path.exists('/usr/lib/X11'):
+-        globbed_x11_dir = glob('/usr/lib/*/libX11.so')
+-        if globbed_x11_dir:
+-            x11_so_dir = os.path.split(globbed_x11_dir[0])[0]
+-            default_x11_lib_dirs.extend([x11_so_dir, '/usr/lib/X11'])
+-            default_x11_include_dirs.extend(['/usr/lib/X11/include',
+-                                             '/usr/include/X11'])
+-
+-    import subprocess as sp
+-    tmp = None
+-    try:
+-        # Explicitly open/close file to avoid ResourceWarning when
+-        # tests are run in debug mode Python 3.
+-        tmp = open(os.devnull, 'w')
+-        p = sp.Popen(["gcc", "-print-multiarch"], stdout=sp.PIPE,
+-                     stderr=tmp)
+-    except (OSError, DistutilsError):
+-        # OSError if gcc is not installed, or SandboxViolation (DistutilsError
+-        # subclass) if an old setuptools bug is triggered (see gh-3160).
+-        pass
+-    else:
+-        triplet = str(p.communicate()[0].decode().strip())
+-        if p.returncode == 0:
+-            # gcc supports the "-print-multiarch" option
+-            default_x11_lib_dirs += [os.path.join("/usr/lib/", triplet)]
+-            default_lib_dirs += [os.path.join("/usr/lib/", triplet)]
+-    finally:
+-        if tmp is not None:
+-            tmp.close()
++    default_lib_dirs = libpaths(['/deadir/lib'], platform_bits)
++    default_include_dirs = ['/deaddir/include']
++    default_src_dirs = ['.', '/deaddir/src']
++
++    default_x11_lib_dirs = libpaths(['/deaddir/lib'], platform_bits)
++    default_x11_include_dirs = ['/deaddir/include']
+ 
+ if os.path.join(sys.prefix, 'lib') not in default_lib_dirs:
+     default_lib_dirs.insert(0, os.path.join(sys.prefix, 'lib'))
diff --git a/meta-arago-distro/recipes-devtools/python-numpy/files/0001-npy_cpu-Add-riscv-support.patch b/meta-arago-distro/recipes-devtools/python-numpy/files/0001-npy_cpu-Add-riscv-support.patch
new file mode 100644
index 0000000..4decfe6
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/python-numpy/files/0001-npy_cpu-Add-riscv-support.patch
@@ -0,0 +1,24 @@
+From 629891f67601275c9c4de0bb01afcf1a8c44fa3f Mon Sep 17 00:00:00 2001
+From: Khem Raj <raj.khem@gmail.com>
+Date: Fri, 16 Mar 2018 19:55:21 -0700
+Subject: [PATCH] npy_cpu: Add riscv support
+
+Signed-off-by: Khem Raj <raj.khem@gmail.com>
+Upstream-Status: Submitted [https://github.com/numpy/numpy/pull/10761]
+---
+ numpy/core/include/numpy/npy_cpu.h | 2 ++
+ 1 file changed, 2 insertions(+)
+
+diff --git a/numpy/core/include/numpy/npy_cpu.h b/numpy/core/include/numpy/npy_cpu.h
+index 5edd8f4..e1e4796 100644
+--- a/numpy/core/include/numpy/npy_cpu.h
++++ b/numpy/core/include/numpy/npy_cpu.h
+@@ -96,6 +96,8 @@
+     #define NPY_CPU_OR1K
+ #elif defined(__mc68000__)
+     #define NPY_CPU_M68K
++#elif defined(__riscv)
++    #define NPY_CPU_RISCV
+ #elif defined(__arc__) && defined(__LITTLE_ENDIAN__)
+     #define NPY_CPU_ARCEL
+ #elif defined(__arc__) && defined(__BIG_ENDIAN__)
diff --git a/meta-arago-distro/recipes-devtools/python-numpy/files/aarch64/_numpyconfig.h b/meta-arago-distro/recipes-devtools/python-numpy/files/aarch64/_numpyconfig.h
new file mode 100644
index 0000000..109deb0
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/python-numpy/files/aarch64/_numpyconfig.h
@@ -0,0 +1,32 @@
+#define NPY_HAVE_ENDIAN_H 1
+#define NPY_SIZEOF_SHORT SIZEOF_SHORT
+#define NPY_SIZEOF_INT SIZEOF_INT
+#define NPY_SIZEOF_LONG SIZEOF_LONG
+#define NPY_SIZEOF_FLOAT 4
+#define NPY_SIZEOF_COMPLEX_FLOAT 8
+#define NPY_SIZEOF_DOUBLE 8
+#define NPY_SIZEOF_COMPLEX_DOUBLE 16
+#define NPY_SIZEOF_LONGDOUBLE 16
+#define NPY_SIZEOF_COMPLEX_LONGDOUBLE 32
+#define NPY_SIZEOF_PY_INTPTR_T 8
+#define NPY_SIZEOF_PY_LONG_LONG 8
+#define NPY_SIZEOF_LONGLONG 8
+#define NPY_SIZEOF_OFF_T 8
+#define NPY_NO_SMP 0
+#define NPY_HAVE_DECL_ISNAN
+#define NPY_HAVE_DECL_ISINF
+#define NPY_HAVE_DECL_ISFINITE
+#define NPY_HAVE_DECL_SIGNBIT
+#define NPY_USE_C99_COMPLEX 1
+#define NPY_HAVE_COMPLEX_DOUBLE 1
+#define NPY_HAVE_COMPLEX_FLOAT 1
+#define NPY_HAVE_COMPLEX_LONG_DOUBLE 1
+#define NPY_ENABLE_SEPARATE_COMPILATION 1
+#define NPY_USE_C99_FORMATS 1
+#define NPY_VISIBILITY_HIDDEN __attribute__((visibility("hidden")))
+#define NPY_ABI_VERSION 0x01000009
+#define NPY_API_VERSION 0x0000000A
+
+#ifndef __STDC_FORMAT_MACROS
+#define __STDC_FORMAT_MACROS 1
+#endif
diff --git a/meta-arago-distro/recipes-devtools/python-numpy/files/aarch64/config.h b/meta-arago-distro/recipes-devtools/python-numpy/files/aarch64/config.h
new file mode 100644
index 0000000..c30b868
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/python-numpy/files/aarch64/config.h
@@ -0,0 +1,139 @@
+#define HAVE_ENDIAN_H 1
+#define SIZEOF_PY_INTPTR_T 8
+#define SIZEOF_PY_LONG_LONG 8
+#define MATHLIB m
+#define HAVE_SIN 1
+#define HAVE_COS 1
+#define HAVE_TAN 1
+#define HAVE_SINH 1
+#define HAVE_COSH 1
+#define HAVE_TANH 1
+#define HAVE_FABS 1
+#define HAVE_FLOOR 1
+#define HAVE_CEIL 1
+#define HAVE_SQRT 1
+#define HAVE_LOG10 1
+#define HAVE_LOG 1
+#define HAVE_EXP 1
+#define HAVE_ASIN 1
+#define HAVE_ACOS 1
+#define HAVE_ATAN 1
+#define HAVE_FMOD 1
+#define HAVE_MODF 1
+#define HAVE_FREXP 1
+#define HAVE_LDEXP 1
+#define HAVE_RINT 1
+#define HAVE_TRUNC 1
+#define HAVE_EXP2 1
+#define HAVE_LOG2 1
+#define HAVE_ATAN2 1
+#define HAVE_POW 1
+#define HAVE_NEXTAFTER 1
+#define HAVE_SINF 1
+#define HAVE_COSF 1
+#define HAVE_TANF 1
+#define HAVE_SINHF 1
+#define HAVE_COSHF 1
+#define HAVE_TANHF 1
+#define HAVE_FABSF 1
+#define HAVE_FLOORF 1
+#define HAVE_CEILF 1
+#define HAVE_RINTF 1
+#define HAVE_TRUNCF 1
+#define HAVE_SQRTF 1
+#define HAVE_LOG10F 1
+#define HAVE_LOGF 1
+#define HAVE_LOG1PF 1
+#define HAVE_EXPF 1
+#define HAVE_EXPM1F 1
+#define HAVE_ASINF 1
+#define HAVE_ACOSF 1
+#define HAVE_ATANF 1
+#define HAVE_ASINHF 1
+#define HAVE_ACOSHF 1
+#define HAVE_ATANHF 1
+#define HAVE_HYPOTF 1
+#define HAVE_ATAN2F 1
+#define HAVE_POWF 1
+#define HAVE_FMODF 1
+#define HAVE_MODFF 1
+#define HAVE_FREXPF 1
+#define HAVE_LDEXPF 1
+#define HAVE_EXP2F 1
+#define HAVE_LOG2F 1
+#define HAVE_COPYSIGNF 1
+#define HAVE_NEXTAFTERF 1
+#define HAVE_SINL 1
+#define HAVE_COSL 1
+#define HAVE_TANL 1
+#define HAVE_SINHL 1
+#define HAVE_COSHL 1
+#define HAVE_TANHL 1
+#define HAVE_FABSL 1
+#define HAVE_FLOORL 1
+#define HAVE_CEILL 1
+#define HAVE_RINTL 1
+#define HAVE_TRUNCL 1
+#define HAVE_SQRTL 1
+#define HAVE_LOG10L 1
+#define HAVE_LOGL 1
+#define HAVE_LOG1PL 1
+#define HAVE_EXPL 1
+#define HAVE_EXPM1L 1
+#define HAVE_ASINL 1
+#define HAVE_ACOSL 1
+#define HAVE_ATANL 1
+#define HAVE_ASINHL 1
+#define HAVE_ACOSHL 1
+#define HAVE_ATANHL 1
+#define HAVE_HYPOTL 1
+#define HAVE_ATAN2L 1
+#define HAVE_POWL 1
+#define HAVE_FMODL 1
+#define HAVE_MODFL 1
+#define HAVE_FREXPL 1
+#define HAVE_LDEXPL 1
+#define HAVE_EXP2L 1
+#define HAVE_LOG2L 1
+#define HAVE_COPYSIGNL 1
+#define HAVE_NEXTAFTERL 1
+#define HAVE_DECL_SIGNBIT
+#define HAVE_COMPLEX_H 1
+#define HAVE_CREAL 1
+#define HAVE_CIMAG 1
+#define HAVE_CABS 1
+#define HAVE_CARG 1
+#define HAVE_CEXP 1
+#define HAVE_CSQRT 1
+#define HAVE_CLOG 1
+#define HAVE_CCOS 1
+#define HAVE_CSIN 1
+#define HAVE_CPOW 1
+#define HAVE_CREALF 1
+#define HAVE_CIMAGF 1
+#define HAVE_CABSF 1
+#define HAVE_CARGF 1
+#define HAVE_CEXPF 1
+#define HAVE_CSQRTF 1
+#define HAVE_CLOGF 1
+#define HAVE_CCOSF 1
+#define HAVE_CSINF 1
+#define HAVE_CPOWF 1
+#define HAVE_CREALL 1
+#define HAVE_CIMAGL 1
+#define HAVE_CABSL 1
+#define HAVE_CARGL 1
+#define HAVE_CEXPL 1
+#define HAVE_CSQRTL 1
+#define HAVE_CLOGL 1
+#define HAVE_CCOSL 1
+#define HAVE_CSINL 1
+#define HAVE_CPOWL 1
+#define HAVE_LDOUBLE_IEEE_QUAD_LE 1
+#ifndef __cplusplus
+/* #undef inline */
+#endif
+
+#ifndef _NPY_NPY_CONFIG_H_
+#error config.h should never be included directly, include npy_config.h instead
+#endif
diff --git a/meta-arago-distro/recipes-devtools/python-numpy/files/arm/config.h b/meta-arago-distro/recipes-devtools/python-numpy/files/arm/config.h
new file mode 100644
index 0000000..17ef186
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/python-numpy/files/arm/config.h
@@ -0,0 +1,21 @@
+/* ./src.linux-i686-2.5/numpy/core/include/numpy/config.h */
+/* #define SIZEOF_SHORT 2 */
+/* #define SIZEOF_INT 4 */
+/* #define SIZEOF_LONG 4 */
+/* #define SIZEOF_FLOAT 4 */
+/* #define SIZEOF_DOUBLE 8 */
+#define SIZEOF_LONG_DOUBLE 12
+#define SIZEOF_PY_INTPTR_T 4
+/* #define SIZEOF_LONG_LONG 8 */
+#define SIZEOF_PY_LONG_LONG 8
+/* #define CHAR_BIT 8 */
+#define MATHLIB m
+#define HAVE_FLOAT_FUNCS
+#define HAVE_LOG1P
+#define HAVE_EXPM1
+#define HAVE_INVERSE_HYPERBOLIC
+#define HAVE_INVERSE_HYPERBOLIC_FLOAT
+#define HAVE_ISNAN
+#define HAVE_ISINF
+#define HAVE_RINT
+
diff --git a/meta-arago-distro/recipes-devtools/python-numpy/files/arm/numpyconfig.h b/meta-arago-distro/recipes-devtools/python-numpy/files/arm/numpyconfig.h
new file mode 100644
index 0000000..c4bf654
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/python-numpy/files/arm/numpyconfig.h
@@ -0,0 +1,17 @@
+/* cat ./src.linux-i686-2.5/numpy/core/include/numpy/numpyconfig.h */
+/*
+ *  * This file is generated by numpy/core/setup.pyc. DO NOT EDIT 
+ *   */
+#define NPY_SIZEOF_SHORT 2 
+#define NPY_SIZEOF_INT 4 
+#define NPY_SIZEOF_LONG 4 
+#define NPY_SIZEOF_FLOAT 4 
+#define NPY_SIZEOF_DOUBLE 8 
+#define NPY_SIZEOF_LONGDOUBLE 12 
+#define NPY_SIZEOF_PY_INTPTR_T 4 
+#define NPY_NO_SMP 0
+
+#define NPY_SIZEOF_LONGLONG 8 
+#define NPY_SIZEOF_PY_LONG_LONG 8 
+/* #define CHAR_BIT 8 */
+
diff --git a/meta-arago-distro/recipes-devtools/python-numpy/files/armeb/config.h b/meta-arago-distro/recipes-devtools/python-numpy/files/armeb/config.h
new file mode 100644
index 0000000..17ef186
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/python-numpy/files/armeb/config.h
@@ -0,0 +1,21 @@
+/* ./src.linux-i686-2.5/numpy/core/include/numpy/config.h */
+/* #define SIZEOF_SHORT 2 */
+/* #define SIZEOF_INT 4 */
+/* #define SIZEOF_LONG 4 */
+/* #define SIZEOF_FLOAT 4 */
+/* #define SIZEOF_DOUBLE 8 */
+#define SIZEOF_LONG_DOUBLE 12
+#define SIZEOF_PY_INTPTR_T 4
+/* #define SIZEOF_LONG_LONG 8 */
+#define SIZEOF_PY_LONG_LONG 8
+/* #define CHAR_BIT 8 */
+#define MATHLIB m
+#define HAVE_FLOAT_FUNCS
+#define HAVE_LOG1P
+#define HAVE_EXPM1
+#define HAVE_INVERSE_HYPERBOLIC
+#define HAVE_INVERSE_HYPERBOLIC_FLOAT
+#define HAVE_ISNAN
+#define HAVE_ISINF
+#define HAVE_RINT
+
diff --git a/meta-arago-distro/recipes-devtools/python-numpy/files/armeb/numpyconfig.h b/meta-arago-distro/recipes-devtools/python-numpy/files/armeb/numpyconfig.h
new file mode 100644
index 0000000..c4bf654
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/python-numpy/files/armeb/numpyconfig.h
@@ -0,0 +1,17 @@
+/* cat ./src.linux-i686-2.5/numpy/core/include/numpy/numpyconfig.h */
+/*
+ *  * This file is generated by numpy/core/setup.pyc. DO NOT EDIT 
+ *   */
+#define NPY_SIZEOF_SHORT 2 
+#define NPY_SIZEOF_INT 4 
+#define NPY_SIZEOF_LONG 4 
+#define NPY_SIZEOF_FLOAT 4 
+#define NPY_SIZEOF_DOUBLE 8 
+#define NPY_SIZEOF_LONGDOUBLE 12 
+#define NPY_SIZEOF_PY_INTPTR_T 4 
+#define NPY_NO_SMP 0
+
+#define NPY_SIZEOF_LONGLONG 8 
+#define NPY_SIZEOF_PY_LONG_LONG 8 
+/* #define CHAR_BIT 8 */
+
diff --git a/meta-arago-distro/recipes-devtools/python-numpy/files/mipsarchn32eb/_numpyconfig.h b/meta-arago-distro/recipes-devtools/python-numpy/files/mipsarchn32eb/_numpyconfig.h
new file mode 100644
index 0000000..8e2b5d0
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/python-numpy/files/mipsarchn32eb/_numpyconfig.h
@@ -0,0 +1,31 @@
+#define NPY_HAVE_ENDIAN_H 1
+#define NPY_SIZEOF_SHORT SIZEOF_SHORT
+#define NPY_SIZEOF_INT SIZEOF_INT
+#define NPY_SIZEOF_LONG SIZEOF_LONG
+#define NPY_SIZEOF_FLOAT 4
+#define NPY_SIZEOF_COMPLEX_FLOAT 8
+#define NPY_SIZEOF_DOUBLE 8
+#define NPY_SIZEOF_COMPLEX_DOUBLE 16
+#define NPY_SIZEOF_LONGDOUBLE 16
+#define NPY_SIZEOF_COMPLEX_LONGDOUBLE 32
+#define NPY_ENABLE_SEPARATE_COMPILATION 1
+#define NPY_SIZEOF_PY_INTPTR_T 8
+#define NPY_SIZEOF_PY_LONG_LONG 8
+#define NPY_SIZEOF_LONGLONG 8
+#define NPY_NO_SMP 0
+#define NPY_HAVE_DECL_ISNAN
+#define NPY_HAVE_DECL_ISINF
+#define NPY_HAVE_DECL_ISFINITE
+#define NPY_HAVE_DECL_SIGNBIT
+#define NPY_USE_C99_COMPLEX 1
+#define NPY_HAVE_COMPLEX_DOUBLE 1
+#define NPY_HAVE_COMPLEX_FLOAT 1
+#define NPY_HAVE_COMPLEX_LONG_DOUBLE 1
+#define NPY_USE_C99_FORMATS 1
+#define NPY_VISIBILITY_HIDDEN __attribute__((visibility("hidden")))
+#define NPY_ABI_VERSION 0x01000009
+#define NPY_API_VERSION 0x0000000A
+
+#ifndef __STDC_FORMAT_MACROS
+#define __STDC_FORMAT_MACROS 1
+#endif
diff --git a/meta-arago-distro/recipes-devtools/python-numpy/files/mipsarchn32eb/config.h b/meta-arago-distro/recipes-devtools/python-numpy/files/mipsarchn32eb/config.h
new file mode 100644
index 0000000..c30b868
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/python-numpy/files/mipsarchn32eb/config.h
@@ -0,0 +1,139 @@
+#define HAVE_ENDIAN_H 1
+#define SIZEOF_PY_INTPTR_T 8
+#define SIZEOF_PY_LONG_LONG 8
+#define MATHLIB m
+#define HAVE_SIN 1
+#define HAVE_COS 1
+#define HAVE_TAN 1
+#define HAVE_SINH 1
+#define HAVE_COSH 1
+#define HAVE_TANH 1
+#define HAVE_FABS 1
+#define HAVE_FLOOR 1
+#define HAVE_CEIL 1
+#define HAVE_SQRT 1
+#define HAVE_LOG10 1
+#define HAVE_LOG 1
+#define HAVE_EXP 1
+#define HAVE_ASIN 1
+#define HAVE_ACOS 1
+#define HAVE_ATAN 1
+#define HAVE_FMOD 1
+#define HAVE_MODF 1
+#define HAVE_FREXP 1
+#define HAVE_LDEXP 1
+#define HAVE_RINT 1
+#define HAVE_TRUNC 1
+#define HAVE_EXP2 1
+#define HAVE_LOG2 1
+#define HAVE_ATAN2 1
+#define HAVE_POW 1
+#define HAVE_NEXTAFTER 1
+#define HAVE_SINF 1
+#define HAVE_COSF 1
+#define HAVE_TANF 1
+#define HAVE_SINHF 1
+#define HAVE_COSHF 1
+#define HAVE_TANHF 1
+#define HAVE_FABSF 1
+#define HAVE_FLOORF 1
+#define HAVE_CEILF 1
+#define HAVE_RINTF 1
+#define HAVE_TRUNCF 1
+#define HAVE_SQRTF 1
+#define HAVE_LOG10F 1
+#define HAVE_LOGF 1
+#define HAVE_LOG1PF 1
+#define HAVE_EXPF 1
+#define HAVE_EXPM1F 1
+#define HAVE_ASINF 1
+#define HAVE_ACOSF 1
+#define HAVE_ATANF 1
+#define HAVE_ASINHF 1
+#define HAVE_ACOSHF 1
+#define HAVE_ATANHF 1
+#define HAVE_HYPOTF 1
+#define HAVE_ATAN2F 1
+#define HAVE_POWF 1
+#define HAVE_FMODF 1
+#define HAVE_MODFF 1
+#define HAVE_FREXPF 1
+#define HAVE_LDEXPF 1
+#define HAVE_EXP2F 1
+#define HAVE_LOG2F 1
+#define HAVE_COPYSIGNF 1
+#define HAVE_NEXTAFTERF 1
+#define HAVE_SINL 1
+#define HAVE_COSL 1
+#define HAVE_TANL 1
+#define HAVE_SINHL 1
+#define HAVE_COSHL 1
+#define HAVE_TANHL 1
+#define HAVE_FABSL 1
+#define HAVE_FLOORL 1
+#define HAVE_CEILL 1
+#define HAVE_RINTL 1
+#define HAVE_TRUNCL 1
+#define HAVE_SQRTL 1
+#define HAVE_LOG10L 1
+#define HAVE_LOGL 1
+#define HAVE_LOG1PL 1
+#define HAVE_EXPL 1
+#define HAVE_EXPM1L 1
+#define HAVE_ASINL 1
+#define HAVE_ACOSL 1
+#define HAVE_ATANL 1
+#define HAVE_ASINHL 1
+#define HAVE_ACOSHL 1
+#define HAVE_ATANHL 1
+#define HAVE_HYPOTL 1
+#define HAVE_ATAN2L 1
+#define HAVE_POWL 1
+#define HAVE_FMODL 1
+#define HAVE_MODFL 1
+#define HAVE_FREXPL 1
+#define HAVE_LDEXPL 1
+#define HAVE_EXP2L 1
+#define HAVE_LOG2L 1
+#define HAVE_COPYSIGNL 1
+#define HAVE_NEXTAFTERL 1
+#define HAVE_DECL_SIGNBIT
+#define HAVE_COMPLEX_H 1
+#define HAVE_CREAL 1
+#define HAVE_CIMAG 1
+#define HAVE_CABS 1
+#define HAVE_CARG 1
+#define HAVE_CEXP 1
+#define HAVE_CSQRT 1
+#define HAVE_CLOG 1
+#define HAVE_CCOS 1
+#define HAVE_CSIN 1
+#define HAVE_CPOW 1
+#define HAVE_CREALF 1
+#define HAVE_CIMAGF 1
+#define HAVE_CABSF 1
+#define HAVE_CARGF 1
+#define HAVE_CEXPF 1
+#define HAVE_CSQRTF 1
+#define HAVE_CLOGF 1
+#define HAVE_CCOSF 1
+#define HAVE_CSINF 1
+#define HAVE_CPOWF 1
+#define HAVE_CREALL 1
+#define HAVE_CIMAGL 1
+#define HAVE_CABSL 1
+#define HAVE_CARGL 1
+#define HAVE_CEXPL 1
+#define HAVE_CSQRTL 1
+#define HAVE_CLOGL 1
+#define HAVE_CCOSL 1
+#define HAVE_CSINL 1
+#define HAVE_CPOWL 1
+#define HAVE_LDOUBLE_IEEE_QUAD_LE 1
+#ifndef __cplusplus
+/* #undef inline */
+#endif
+
+#ifndef _NPY_NPY_CONFIG_H_
+#error config.h should never be included directly, include npy_config.h instead
+#endif
diff --git a/meta-arago-distro/recipes-devtools/python-numpy/files/mipsarchn32el/_numpyconfig.h b/meta-arago-distro/recipes-devtools/python-numpy/files/mipsarchn32el/_numpyconfig.h
new file mode 100644
index 0000000..8e2b5d0
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/python-numpy/files/mipsarchn32el/_numpyconfig.h
@@ -0,0 +1,31 @@
+#define NPY_HAVE_ENDIAN_H 1
+#define NPY_SIZEOF_SHORT SIZEOF_SHORT
+#define NPY_SIZEOF_INT SIZEOF_INT
+#define NPY_SIZEOF_LONG SIZEOF_LONG
+#define NPY_SIZEOF_FLOAT 4
+#define NPY_SIZEOF_COMPLEX_FLOAT 8
+#define NPY_SIZEOF_DOUBLE 8
+#define NPY_SIZEOF_COMPLEX_DOUBLE 16
+#define NPY_SIZEOF_LONGDOUBLE 16
+#define NPY_SIZEOF_COMPLEX_LONGDOUBLE 32
+#define NPY_ENABLE_SEPARATE_COMPILATION 1
+#define NPY_SIZEOF_PY_INTPTR_T 8
+#define NPY_SIZEOF_PY_LONG_LONG 8
+#define NPY_SIZEOF_LONGLONG 8
+#define NPY_NO_SMP 0
+#define NPY_HAVE_DECL_ISNAN
+#define NPY_HAVE_DECL_ISINF
+#define NPY_HAVE_DECL_ISFINITE
+#define NPY_HAVE_DECL_SIGNBIT
+#define NPY_USE_C99_COMPLEX 1
+#define NPY_HAVE_COMPLEX_DOUBLE 1
+#define NPY_HAVE_COMPLEX_FLOAT 1
+#define NPY_HAVE_COMPLEX_LONG_DOUBLE 1
+#define NPY_USE_C99_FORMATS 1
+#define NPY_VISIBILITY_HIDDEN __attribute__((visibility("hidden")))
+#define NPY_ABI_VERSION 0x01000009
+#define NPY_API_VERSION 0x0000000A
+
+#ifndef __STDC_FORMAT_MACROS
+#define __STDC_FORMAT_MACROS 1
+#endif
diff --git a/meta-arago-distro/recipes-devtools/python-numpy/files/mipsarchn32el/config.h b/meta-arago-distro/recipes-devtools/python-numpy/files/mipsarchn32el/config.h
new file mode 100644
index 0000000..4872703
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/python-numpy/files/mipsarchn32el/config.h
@@ -0,0 +1,138 @@
+#define SIZEOF_PY_INTPTR_T 8
+#define SIZEOF_PY_LONG_LONG 8
+#define MATHLIB m
+#define HAVE_SIN 1
+#define HAVE_COS 1
+#define HAVE_TAN 1
+#define HAVE_SINH 1
+#define HAVE_COSH 1
+#define HAVE_TANH 1
+#define HAVE_FABS 1
+#define HAVE_FLOOR 1
+#define HAVE_CEIL 1
+#define HAVE_SQRT 1
+#define HAVE_LOG10 1
+#define HAVE_LOG 1
+#define HAVE_EXP 1
+#define HAVE_ASIN 1
+#define HAVE_ACOS 1
+#define HAVE_ATAN 1
+#define HAVE_FMOD 1
+#define HAVE_MODF 1
+#define HAVE_FREXP 1
+#define HAVE_LDEXP 1
+#define HAVE_RINT 1
+#define HAVE_TRUNC 1
+#define HAVE_EXP2 1
+#define HAVE_LOG2 1
+#define HAVE_ATAN2 1
+#define HAVE_POW 1
+#define HAVE_NEXTAFTER 1
+#define HAVE_SINF 1
+#define HAVE_COSF 1
+#define HAVE_TANF 1
+#define HAVE_SINHF 1
+#define HAVE_COSHF 1
+#define HAVE_TANHF 1
+#define HAVE_FABSF 1
+#define HAVE_FLOORF 1
+#define HAVE_CEILF 1
+#define HAVE_RINTF 1
+#define HAVE_TRUNCF 1
+#define HAVE_SQRTF 1
+#define HAVE_LOG10F 1
+#define HAVE_LOGF 1
+#define HAVE_LOG1PF 1
+#define HAVE_EXPF 1
+#define HAVE_EXPM1F 1
+#define HAVE_ASINF 1
+#define HAVE_ACOSF 1
+#define HAVE_ATANF 1
+#define HAVE_ASINHF 1
+#define HAVE_ACOSHF 1
+#define HAVE_ATANHF 1
+#define HAVE_HYPOTF 1
+#define HAVE_ATAN2F 1
+#define HAVE_POWF 1
+#define HAVE_FMODF 1
+#define HAVE_MODFF 1
+#define HAVE_FREXPF 1
+#define HAVE_LDEXPF 1
+#define HAVE_EXP2F 1
+#define HAVE_LOG2F 1
+#define HAVE_COPYSIGNF 1
+#define HAVE_NEXTAFTERF 1
+#define HAVE_SINL 1
+#define HAVE_COSL 1
+#define HAVE_TANL 1
+#define HAVE_SINHL 1
+#define HAVE_COSHL 1
+#define HAVE_TANHL 1
+#define HAVE_FABSL 1
+#define HAVE_FLOORL 1
+#define HAVE_CEILL 1
+#define HAVE_RINTL 1
+#define HAVE_TRUNCL 1
+#define HAVE_SQRTL 1
+#define HAVE_LOG10L 1
+#define HAVE_LOGL 1
+#define HAVE_LOG1PL 1
+#define HAVE_EXPL 1
+#define HAVE_EXPM1L 1
+#define HAVE_ASINL 1
+#define HAVE_ACOSL 1
+#define HAVE_ATANL 1
+#define HAVE_ASINHL 1
+#define HAVE_ACOSHL 1
+#define HAVE_ATANHL 1
+#define HAVE_HYPOTL 1
+#define HAVE_ATAN2L 1
+#define HAVE_POWL 1
+#define HAVE_FMODL 1
+#define HAVE_MODFL 1
+#define HAVE_FREXPL 1
+#define HAVE_LDEXPL 1
+#define HAVE_EXP2L 1
+#define HAVE_LOG2L 1
+#define HAVE_COPYSIGNL 1
+#define HAVE_NEXTAFTERL 1
+#define HAVE_DECL_SIGNBIT
+#define HAVE_COMPLEX_H 1
+#define HAVE_CREAL 1
+#define HAVE_CIMAG 1
+#define HAVE_CABS 1
+#define HAVE_CARG 1
+#define HAVE_CEXP 1
+#define HAVE_CSQRT 1
+#define HAVE_CLOG 1
+#define HAVE_CCOS 1
+#define HAVE_CSIN 1
+#define HAVE_CPOW 1
+#define HAVE_CREALF 1
+#define HAVE_CIMAGF 1
+#define HAVE_CABSF 1
+#define HAVE_CARGF 1
+#define HAVE_CEXPF 1
+#define HAVE_CSQRTF 1
+#define HAVE_CLOGF 1
+#define HAVE_CCOSF 1
+#define HAVE_CSINF 1
+#define HAVE_CPOWF 1
+#define HAVE_CREALL 1
+#define HAVE_CIMAGL 1
+#define HAVE_CABSL 1
+#define HAVE_CARGL 1
+#define HAVE_CEXPL 1
+#define HAVE_CSQRTL 1
+#define HAVE_CLOGL 1
+#define HAVE_CCOSL 1
+#define HAVE_CSINL 1
+#define HAVE_CPOWL 1
+#define HAVE_LDOUBLE_IEEE_QUAD_LE 1
+#ifndef __cplusplus
+/* #undef inline */
+#endif
+
+#ifndef _NPY_NPY_CONFIG_H_
+#error config.h should never be included directly, include npy_config.h instead
+#endif
diff --git a/meta-arago-distro/recipes-devtools/python-numpy/files/mipsarchn64eb/_numpyconfig.h b/meta-arago-distro/recipes-devtools/python-numpy/files/mipsarchn64eb/_numpyconfig.h
new file mode 100644
index 0000000..debb390
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/python-numpy/files/mipsarchn64eb/_numpyconfig.h
@@ -0,0 +1,32 @@
+#define NPY_HAVE_ENDIAN_H 1
+#define NPY_SIZEOF_SHORT SIZEOF_SHORT
+#define NPY_SIZEOF_INT SIZEOF_INT
+#define NPY_SIZEOF_LONG SIZEOF_LONG
+#define NPY_SIZEOF_FLOAT 4
+#define NPY_SIZEOF_COMPLEX_FLOAT 8
+#define NPY_SIZEOF_DOUBLE 8
+#define NPY_SIZEOF_COMPLEX_DOUBLE 16
+#define NPY_SIZEOF_LONGDOUBLE 16
+#define NPY_SIZEOF_COMPLEX_LONGDOUBLE 32
+#define NPY_ENABLE_SEPARATE_COMPILATION 1
+#define NPY_SIZEOF_PY_INTPTR_T 8
+#define NPY_SIZEOF_PY_LONG_LONG 8
+#define NPY_SIZEOF_LONGLONG 8
+#define NPY_SIZEOF_OFF_T 8
+#define NPY_NO_SMP 0
+#define NPY_HAVE_DECL_ISNAN
+#define NPY_HAVE_DECL_ISINF
+#define NPY_HAVE_DECL_ISFINITE
+#define NPY_HAVE_DECL_SIGNBIT
+#define NPY_USE_C99_COMPLEX 1
+#define NPY_HAVE_COMPLEX_DOUBLE 1
+#define NPY_HAVE_COMPLEX_FLOAT 1
+#define NPY_HAVE_COMPLEX_LONG_DOUBLE 1
+#define NPY_USE_C99_FORMATS 1
+#define NPY_VISIBILITY_HIDDEN __attribute__((visibility("hidden")))
+#define NPY_ABI_VERSION 0x01000009
+#define NPY_API_VERSION 0x0000000A
+
+#ifndef __STDC_FORMAT_MACROS
+#define __STDC_FORMAT_MACROS 1
+#endif
diff --git a/meta-arago-distro/recipes-devtools/python-numpy/files/mipsarchn64eb/config.h b/meta-arago-distro/recipes-devtools/python-numpy/files/mipsarchn64eb/config.h
new file mode 100644
index 0000000..c30b868
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/python-numpy/files/mipsarchn64eb/config.h
@@ -0,0 +1,139 @@
+#define HAVE_ENDIAN_H 1
+#define SIZEOF_PY_INTPTR_T 8
+#define SIZEOF_PY_LONG_LONG 8
+#define MATHLIB m
+#define HAVE_SIN 1
+#define HAVE_COS 1
+#define HAVE_TAN 1
+#define HAVE_SINH 1
+#define HAVE_COSH 1
+#define HAVE_TANH 1
+#define HAVE_FABS 1
+#define HAVE_FLOOR 1
+#define HAVE_CEIL 1
+#define HAVE_SQRT 1
+#define HAVE_LOG10 1
+#define HAVE_LOG 1
+#define HAVE_EXP 1
+#define HAVE_ASIN 1
+#define HAVE_ACOS 1
+#define HAVE_ATAN 1
+#define HAVE_FMOD 1
+#define HAVE_MODF 1
+#define HAVE_FREXP 1
+#define HAVE_LDEXP 1
+#define HAVE_RINT 1
+#define HAVE_TRUNC 1
+#define HAVE_EXP2 1
+#define HAVE_LOG2 1
+#define HAVE_ATAN2 1
+#define HAVE_POW 1
+#define HAVE_NEXTAFTER 1
+#define HAVE_SINF 1
+#define HAVE_COSF 1
+#define HAVE_TANF 1
+#define HAVE_SINHF 1
+#define HAVE_COSHF 1
+#define HAVE_TANHF 1
+#define HAVE_FABSF 1
+#define HAVE_FLOORF 1
+#define HAVE_CEILF 1
+#define HAVE_RINTF 1
+#define HAVE_TRUNCF 1
+#define HAVE_SQRTF 1
+#define HAVE_LOG10F 1
+#define HAVE_LOGF 1
+#define HAVE_LOG1PF 1
+#define HAVE_EXPF 1
+#define HAVE_EXPM1F 1
+#define HAVE_ASINF 1
+#define HAVE_ACOSF 1
+#define HAVE_ATANF 1
+#define HAVE_ASINHF 1
+#define HAVE_ACOSHF 1
+#define HAVE_ATANHF 1
+#define HAVE_HYPOTF 1
+#define HAVE_ATAN2F 1
+#define HAVE_POWF 1
+#define HAVE_FMODF 1
+#define HAVE_MODFF 1
+#define HAVE_FREXPF 1
+#define HAVE_LDEXPF 1
+#define HAVE_EXP2F 1
+#define HAVE_LOG2F 1
+#define HAVE_COPYSIGNF 1
+#define HAVE_NEXTAFTERF 1
+#define HAVE_SINL 1
+#define HAVE_COSL 1
+#define HAVE_TANL 1
+#define HAVE_SINHL 1
+#define HAVE_COSHL 1
+#define HAVE_TANHL 1
+#define HAVE_FABSL 1
+#define HAVE_FLOORL 1
+#define HAVE_CEILL 1
+#define HAVE_RINTL 1
+#define HAVE_TRUNCL 1
+#define HAVE_SQRTL 1
+#define HAVE_LOG10L 1
+#define HAVE_LOGL 1
+#define HAVE_LOG1PL 1
+#define HAVE_EXPL 1
+#define HAVE_EXPM1L 1
+#define HAVE_ASINL 1
+#define HAVE_ACOSL 1
+#define HAVE_ATANL 1
+#define HAVE_ASINHL 1
+#define HAVE_ACOSHL 1
+#define HAVE_ATANHL 1
+#define HAVE_HYPOTL 1
+#define HAVE_ATAN2L 1
+#define HAVE_POWL 1
+#define HAVE_FMODL 1
+#define HAVE_MODFL 1
+#define HAVE_FREXPL 1
+#define HAVE_LDEXPL 1
+#define HAVE_EXP2L 1
+#define HAVE_LOG2L 1
+#define HAVE_COPYSIGNL 1
+#define HAVE_NEXTAFTERL 1
+#define HAVE_DECL_SIGNBIT
+#define HAVE_COMPLEX_H 1
+#define HAVE_CREAL 1
+#define HAVE_CIMAG 1
+#define HAVE_CABS 1
+#define HAVE_CARG 1
+#define HAVE_CEXP 1
+#define HAVE_CSQRT 1
+#define HAVE_CLOG 1
+#define HAVE_CCOS 1
+#define HAVE_CSIN 1
+#define HAVE_CPOW 1
+#define HAVE_CREALF 1
+#define HAVE_CIMAGF 1
+#define HAVE_CABSF 1
+#define HAVE_CARGF 1
+#define HAVE_CEXPF 1
+#define HAVE_CSQRTF 1
+#define HAVE_CLOGF 1
+#define HAVE_CCOSF 1
+#define HAVE_CSINF 1
+#define HAVE_CPOWF 1
+#define HAVE_CREALL 1
+#define HAVE_CIMAGL 1
+#define HAVE_CABSL 1
+#define HAVE_CARGL 1
+#define HAVE_CEXPL 1
+#define HAVE_CSQRTL 1
+#define HAVE_CLOGL 1
+#define HAVE_CCOSL 1
+#define HAVE_CSINL 1
+#define HAVE_CPOWL 1
+#define HAVE_LDOUBLE_IEEE_QUAD_LE 1
+#ifndef __cplusplus
+/* #undef inline */
+#endif
+
+#ifndef _NPY_NPY_CONFIG_H_
+#error config.h should never be included directly, include npy_config.h instead
+#endif
diff --git a/meta-arago-distro/recipes-devtools/python-numpy/files/mipsarchn64el/_numpyconfig.h b/meta-arago-distro/recipes-devtools/python-numpy/files/mipsarchn64el/_numpyconfig.h
new file mode 100644
index 0000000..debb390
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/python-numpy/files/mipsarchn64el/_numpyconfig.h
@@ -0,0 +1,32 @@
+#define NPY_HAVE_ENDIAN_H 1
+#define NPY_SIZEOF_SHORT SIZEOF_SHORT
+#define NPY_SIZEOF_INT SIZEOF_INT
+#define NPY_SIZEOF_LONG SIZEOF_LONG
+#define NPY_SIZEOF_FLOAT 4
+#define NPY_SIZEOF_COMPLEX_FLOAT 8
+#define NPY_SIZEOF_DOUBLE 8
+#define NPY_SIZEOF_COMPLEX_DOUBLE 16
+#define NPY_SIZEOF_LONGDOUBLE 16
+#define NPY_SIZEOF_COMPLEX_LONGDOUBLE 32
+#define NPY_ENABLE_SEPARATE_COMPILATION 1
+#define NPY_SIZEOF_PY_INTPTR_T 8
+#define NPY_SIZEOF_PY_LONG_LONG 8
+#define NPY_SIZEOF_LONGLONG 8
+#define NPY_SIZEOF_OFF_T 8
+#define NPY_NO_SMP 0
+#define NPY_HAVE_DECL_ISNAN
+#define NPY_HAVE_DECL_ISINF
+#define NPY_HAVE_DECL_ISFINITE
+#define NPY_HAVE_DECL_SIGNBIT
+#define NPY_USE_C99_COMPLEX 1
+#define NPY_HAVE_COMPLEX_DOUBLE 1
+#define NPY_HAVE_COMPLEX_FLOAT 1
+#define NPY_HAVE_COMPLEX_LONG_DOUBLE 1
+#define NPY_USE_C99_FORMATS 1
+#define NPY_VISIBILITY_HIDDEN __attribute__((visibility("hidden")))
+#define NPY_ABI_VERSION 0x01000009
+#define NPY_API_VERSION 0x0000000A
+
+#ifndef __STDC_FORMAT_MACROS
+#define __STDC_FORMAT_MACROS 1
+#endif
diff --git a/meta-arago-distro/recipes-devtools/python-numpy/files/mipsarchn64el/config.h b/meta-arago-distro/recipes-devtools/python-numpy/files/mipsarchn64el/config.h
new file mode 100644
index 0000000..4872703
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/python-numpy/files/mipsarchn64el/config.h
@@ -0,0 +1,138 @@
+#define SIZEOF_PY_INTPTR_T 8
+#define SIZEOF_PY_LONG_LONG 8
+#define MATHLIB m
+#define HAVE_SIN 1
+#define HAVE_COS 1
+#define HAVE_TAN 1
+#define HAVE_SINH 1
+#define HAVE_COSH 1
+#define HAVE_TANH 1
+#define HAVE_FABS 1
+#define HAVE_FLOOR 1
+#define HAVE_CEIL 1
+#define HAVE_SQRT 1
+#define HAVE_LOG10 1
+#define HAVE_LOG 1
+#define HAVE_EXP 1
+#define HAVE_ASIN 1
+#define HAVE_ACOS 1
+#define HAVE_ATAN 1
+#define HAVE_FMOD 1
+#define HAVE_MODF 1
+#define HAVE_FREXP 1
+#define HAVE_LDEXP 1
+#define HAVE_RINT 1
+#define HAVE_TRUNC 1
+#define HAVE_EXP2 1
+#define HAVE_LOG2 1
+#define HAVE_ATAN2 1
+#define HAVE_POW 1
+#define HAVE_NEXTAFTER 1
+#define HAVE_SINF 1
+#define HAVE_COSF 1
+#define HAVE_TANF 1
+#define HAVE_SINHF 1
+#define HAVE_COSHF 1
+#define HAVE_TANHF 1
+#define HAVE_FABSF 1
+#define HAVE_FLOORF 1
+#define HAVE_CEILF 1
+#define HAVE_RINTF 1
+#define HAVE_TRUNCF 1
+#define HAVE_SQRTF 1
+#define HAVE_LOG10F 1
+#define HAVE_LOGF 1
+#define HAVE_LOG1PF 1
+#define HAVE_EXPF 1
+#define HAVE_EXPM1F 1
+#define HAVE_ASINF 1
+#define HAVE_ACOSF 1
+#define HAVE_ATANF 1
+#define HAVE_ASINHF 1
+#define HAVE_ACOSHF 1
+#define HAVE_ATANHF 1
+#define HAVE_HYPOTF 1
+#define HAVE_ATAN2F 1
+#define HAVE_POWF 1
+#define HAVE_FMODF 1
+#define HAVE_MODFF 1
+#define HAVE_FREXPF 1
+#define HAVE_LDEXPF 1
+#define HAVE_EXP2F 1
+#define HAVE_LOG2F 1
+#define HAVE_COPYSIGNF 1
+#define HAVE_NEXTAFTERF 1
+#define HAVE_SINL 1
+#define HAVE_COSL 1
+#define HAVE_TANL 1
+#define HAVE_SINHL 1
+#define HAVE_COSHL 1
+#define HAVE_TANHL 1
+#define HAVE_FABSL 1
+#define HAVE_FLOORL 1
+#define HAVE_CEILL 1
+#define HAVE_RINTL 1
+#define HAVE_TRUNCL 1
+#define HAVE_SQRTL 1
+#define HAVE_LOG10L 1
+#define HAVE_LOGL 1
+#define HAVE_LOG1PL 1
+#define HAVE_EXPL 1
+#define HAVE_EXPM1L 1
+#define HAVE_ASINL 1
+#define HAVE_ACOSL 1
+#define HAVE_ATANL 1
+#define HAVE_ASINHL 1
+#define HAVE_ACOSHL 1
+#define HAVE_ATANHL 1
+#define HAVE_HYPOTL 1
+#define HAVE_ATAN2L 1
+#define HAVE_POWL 1
+#define HAVE_FMODL 1
+#define HAVE_MODFL 1
+#define HAVE_FREXPL 1
+#define HAVE_LDEXPL 1
+#define HAVE_EXP2L 1
+#define HAVE_LOG2L 1
+#define HAVE_COPYSIGNL 1
+#define HAVE_NEXTAFTERL 1
+#define HAVE_DECL_SIGNBIT
+#define HAVE_COMPLEX_H 1
+#define HAVE_CREAL 1
+#define HAVE_CIMAG 1
+#define HAVE_CABS 1
+#define HAVE_CARG 1
+#define HAVE_CEXP 1
+#define HAVE_CSQRT 1
+#define HAVE_CLOG 1
+#define HAVE_CCOS 1
+#define HAVE_CSIN 1
+#define HAVE_CPOW 1
+#define HAVE_CREALF 1
+#define HAVE_CIMAGF 1
+#define HAVE_CABSF 1
+#define HAVE_CARGF 1
+#define HAVE_CEXPF 1
+#define HAVE_CSQRTF 1
+#define HAVE_CLOGF 1
+#define HAVE_CCOSF 1
+#define HAVE_CSINF 1
+#define HAVE_CPOWF 1
+#define HAVE_CREALL 1
+#define HAVE_CIMAGL 1
+#define HAVE_CABSL 1
+#define HAVE_CARGL 1
+#define HAVE_CEXPL 1
+#define HAVE_CSQRTL 1
+#define HAVE_CLOGL 1
+#define HAVE_CCOSL 1
+#define HAVE_CSINL 1
+#define HAVE_CPOWL 1
+#define HAVE_LDOUBLE_IEEE_QUAD_LE 1
+#ifndef __cplusplus
+/* #undef inline */
+#endif
+
+#ifndef _NPY_NPY_CONFIG_H_
+#error config.h should never be included directly, include npy_config.h instead
+#endif
diff --git a/meta-arago-distro/recipes-devtools/python-numpy/files/mipsarcho32eb/_numpyconfig.h b/meta-arago-distro/recipes-devtools/python-numpy/files/mipsarcho32eb/_numpyconfig.h
new file mode 100644
index 0000000..4c465c2
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/python-numpy/files/mipsarcho32eb/_numpyconfig.h
@@ -0,0 +1,32 @@
+#define NPY_HAVE_ENDIAN_H 1
+#define NPY_SIZEOF_SHORT SIZEOF_SHORT
+#define NPY_SIZEOF_INT SIZEOF_INT
+#define NPY_SIZEOF_LONG SIZEOF_LONG
+#define NPY_SIZEOF_FLOAT 4
+#define NPY_SIZEOF_COMPLEX_FLOAT 8
+#define NPY_SIZEOF_DOUBLE 8
+#define NPY_SIZEOF_COMPLEX_DOUBLE 16
+#define NPY_SIZEOF_LONGDOUBLE 8
+#define NPY_SIZEOF_COMPLEX_LONGDOUBLE 16
+#define NPY_ENABLE_SEPARATE_COMPILATION 1
+#define NPY_SIZEOF_PY_INTPTR_T 4
+#define NPY_SIZEOF_PY_LONG_LONG 8
+#define NPY_SIZEOF_LONGLONG 8
+#define NPY_SIZEOF_OFF_T 8
+#define NPY_NO_SMP 0
+#define NPY_HAVE_DECL_ISNAN
+#define NPY_HAVE_DECL_ISINF
+#define NPY_HAVE_DECL_ISFINITE
+#define NPY_HAVE_DECL_SIGNBIT
+#define NPY_USE_C99_COMPLEX 1
+#define NPY_HAVE_COMPLEX_DOUBLE 1
+#define NPY_HAVE_COMPLEX_FLOAT 1
+#define NPY_HAVE_COMPLEX_LONG_DOUBLE 1
+#define NPY_USE_C99_FORMATS 1
+#define NPY_VISIBILITY_HIDDEN __attribute__((visibility("hidden")))
+#define NPY_ABI_VERSION 0x01000009
+#define NPY_API_VERSION 0x0000000A
+
+#ifndef __STDC_FORMAT_MACROS
+#define __STDC_FORMAT_MACROS 1
+#endif
diff --git a/meta-arago-distro/recipes-devtools/python-numpy/files/mipsarcho32eb/config.h b/meta-arago-distro/recipes-devtools/python-numpy/files/mipsarcho32eb/config.h
new file mode 100644
index 0000000..2f6135a
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/python-numpy/files/mipsarcho32eb/config.h
@@ -0,0 +1,139 @@
+#define HAVE_ENDIAN_H 1
+#define SIZEOF_PY_INTPTR_T 4
+#define SIZEOF_PY_LONG_LONG 8
+#define MATHLIB m
+#define HAVE_SIN 1
+#define HAVE_COS 1
+#define HAVE_TAN 1
+#define HAVE_SINH 1
+#define HAVE_COSH 1
+#define HAVE_TANH 1
+#define HAVE_FABS 1
+#define HAVE_FLOOR 1
+#define HAVE_CEIL 1
+#define HAVE_SQRT 1
+#define HAVE_LOG10 1
+#define HAVE_LOG 1
+#define HAVE_EXP 1
+#define HAVE_ASIN 1
+#define HAVE_ACOS 1
+#define HAVE_ATAN 1
+#define HAVE_FMOD 1
+#define HAVE_MODF 1
+#define HAVE_FREXP 1
+#define HAVE_LDEXP 1
+#define HAVE_RINT 1
+#define HAVE_TRUNC 1
+#define HAVE_EXP2 1
+#define HAVE_LOG2 1
+#define HAVE_ATAN2 1
+#define HAVE_POW 1
+#define HAVE_NEXTAFTER 1
+#define HAVE_SINF 1
+#define HAVE_COSF 1
+#define HAVE_TANF 1
+#define HAVE_SINHF 1
+#define HAVE_COSHF 1
+#define HAVE_TANHF 1
+#define HAVE_FABSF 1
+#define HAVE_FLOORF 1
+#define HAVE_CEILF 1
+#define HAVE_RINTF 1
+#define HAVE_TRUNCF 1
+#define HAVE_SQRTF 1
+#define HAVE_LOG10F 1
+#define HAVE_LOGF 1
+#define HAVE_LOG1PF 1
+#define HAVE_EXPF 1
+#define HAVE_EXPM1F 1
+#define HAVE_ASINF 1
+#define HAVE_ACOSF 1
+#define HAVE_ATANF 1
+#define HAVE_ASINHF 1
+#define HAVE_ACOSHF 1
+#define HAVE_ATANHF 1
+#define HAVE_HYPOTF 1
+#define HAVE_ATAN2F 1
+#define HAVE_POWF 1
+#define HAVE_FMODF 1
+#define HAVE_MODFF 1
+#define HAVE_FREXPF 1
+#define HAVE_LDEXPF 1
+#define HAVE_EXP2F 1
+#define HAVE_LOG2F 1
+#define HAVE_COPYSIGNF 1
+#define HAVE_NEXTAFTERF 1
+#define HAVE_SINL 1
+#define HAVE_COSL 1
+#define HAVE_TANL 1
+#define HAVE_SINHL 1
+#define HAVE_COSHL 1
+#define HAVE_TANHL 1
+#define HAVE_FABSL 1
+#define HAVE_FLOORL 1
+#define HAVE_CEILL 1
+#define HAVE_RINTL 1
+#define HAVE_TRUNCL 1
+#define HAVE_SQRTL 1
+#define HAVE_LOG10L 1
+#define HAVE_LOGL 1
+#define HAVE_LOG1PL 1
+#define HAVE_EXPL 1
+#define HAVE_EXPM1L 1
+#define HAVE_ASINL 1
+#define HAVE_ACOSL 1
+#define HAVE_ATANL 1
+#define HAVE_ASINHL 1
+#define HAVE_ACOSHL 1
+#define HAVE_ATANHL 1
+#define HAVE_HYPOTL 1
+#define HAVE_ATAN2L 1
+#define HAVE_POWL 1
+#define HAVE_FMODL 1
+#define HAVE_MODFL 1
+#define HAVE_FREXPL 1
+#define HAVE_LDEXPL 1
+#define HAVE_EXP2L 1
+#define HAVE_LOG2L 1
+#define HAVE_COPYSIGNL 1
+#define HAVE_NEXTAFTERL 1
+#define HAVE_DECL_SIGNBIT
+#define HAVE_COMPLEX_H 1
+#define HAVE_CREAL 1
+#define HAVE_CIMAG 1
+#define HAVE_CABS 1
+#define HAVE_CARG 1
+#define HAVE_CEXP 1
+#define HAVE_CSQRT 1
+#define HAVE_CLOG 1
+#define HAVE_CCOS 1
+#define HAVE_CSIN 1
+#define HAVE_CPOW 1
+#define HAVE_CREALF 1
+#define HAVE_CIMAGF 1
+#define HAVE_CABSF 1
+#define HAVE_CARGF 1
+#define HAVE_CEXPF 1
+#define HAVE_CSQRTF 1
+#define HAVE_CLOGF 1
+#define HAVE_CCOSF 1
+#define HAVE_CSINF 1
+#define HAVE_CPOWF 1
+#define HAVE_CREALL 1
+#define HAVE_CIMAGL 1
+#define HAVE_CABSL 1
+#define HAVE_CARGL 1
+#define HAVE_CEXPL 1
+#define HAVE_CSQRTL 1
+#define HAVE_CLOGL 1
+#define HAVE_CCOSL 1
+#define HAVE_CSINL 1
+#define HAVE_CPOWL 1
+#define HAVE_LDOUBLE_IEEE_DOUBLE_BE 1
+#ifndef __cplusplus
+/* #undef inline */
+#endif
+
+#ifndef _NPY_NPY_CONFIG_H_
+#error config.h should never be included directly, include npy_config.h instead
+#endif
diff --git a/meta-arago-distro/recipes-devtools/python-numpy/files/mipsarcho32el/config.h b/meta-arago-distro/recipes-devtools/python-numpy/files/mipsarcho32el/config.h
new file mode 100644
index 0000000..17ef186
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/python-numpy/files/mipsarcho32el/config.h
@@ -0,0 +1,21 @@
+/* ./src.linux-i686-2.5/numpy/core/include/numpy/config.h */
+/* #define SIZEOF_SHORT 2 */
+/* #define SIZEOF_INT 4 */
+/* #define SIZEOF_LONG 4 */
+/* #define SIZEOF_FLOAT 4 */
+/* #define SIZEOF_DOUBLE 8 */
+#define SIZEOF_LONG_DOUBLE 12
+#define SIZEOF_PY_INTPTR_T 4
+/* #define SIZEOF_LONG_LONG 8 */
+#define SIZEOF_PY_LONG_LONG 8
+/* #define CHAR_BIT 8 */
+#define MATHLIB m
+#define HAVE_FLOAT_FUNCS
+#define HAVE_LOG1P
+#define HAVE_EXPM1
+#define HAVE_INVERSE_HYPERBOLIC
+#define HAVE_INVERSE_HYPERBOLIC_FLOAT
+#define HAVE_ISNAN
+#define HAVE_ISINF
+#define HAVE_RINT
+
diff --git a/meta-arago-distro/recipes-devtools/python-numpy/files/mipsarcho32el/numpyconfig.h b/meta-arago-distro/recipes-devtools/python-numpy/files/mipsarcho32el/numpyconfig.h
new file mode 100644
index 0000000..0b7cd51
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/python-numpy/files/mipsarcho32el/numpyconfig.h
@@ -0,0 +1,18 @@
+/* cat ./src.linux-i686-2.5/numpy/core/include/numpy/numpyconfig.h */
+/*
+ *  * This file is generated by numpy/core/setup.pyc. DO NOT EDIT 
+ *   */
+#define NPY_SIZEOF_SHORT 2 
+#define NPY_SIZEOF_INT 4 
+#define NPY_SIZEOF_LONG 4 
+#define NPY_SIZEOF_FLOAT 4 
+#define NPY_SIZEOF_DOUBLE 8 
+#define NPY_SIZEOF_LONGDOUBLE 12 
+#define NPY_SIZEOF_PY_INTPTR_T 4 
+#define NPY_NO_SMP 0
+
+#define NPY_SIZEOF_LONGLONG 8 
+#define NPY_SIZEOF_PY_LONG_LONG 8 
+#define NPY_SIZEOF_OFF_T 8
+/* #define CHAR_BIT 8 */
+
diff --git a/meta-arago-distro/recipes-devtools/python-numpy/files/powerpc/_numpyconfig.h b/meta-arago-distro/recipes-devtools/python-numpy/files/powerpc/_numpyconfig.h
new file mode 100644
index 0000000..6e7262a
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/python-numpy/files/powerpc/_numpyconfig.h
@@ -0,0 +1,32 @@
+#define NPY_HAVE_ENDIAN_H 1
+#define NPY_SIZEOF_SHORT SIZEOF_SHORT
+#define NPY_SIZEOF_INT SIZEOF_INT
+#define NPY_SIZEOF_LONG SIZEOF_LONG
+#define NPY_SIZEOF_FLOAT 4
+#define NPY_SIZEOF_COMPLEX_FLOAT 8
+#define NPY_SIZEOF_DOUBLE 8
+#define NPY_SIZEOF_COMPLEX_DOUBLE 16
+#define NPY_SIZEOF_LONGDOUBLE 16
+#define NPY_SIZEOF_COMPLEX_LONGDOUBLE 32
+#define NPY_ENABLE_SEPARATE_COMPILATION 1
+#define NPY_SIZEOF_PY_INTPTR_T 4
+#define NPY_SIZEOF_PY_LONG_LONG 8
+#define NPY_SIZEOF_LONGLONG 8
+#define NPY_SIZEOF_OFF_T 8
+#define NPY_NO_SMP 0
+#define NPY_HAVE_DECL_ISNAN
+#define NPY_HAVE_DECL_ISINF
+#define NPY_HAVE_DECL_ISFINITE
+#define NPY_HAVE_DECL_SIGNBIT
+#define NPY_USE_C99_COMPLEX 1
+#define NPY_HAVE_COMPLEX_DOUBLE 1
+#define NPY_HAVE_COMPLEX_FLOAT 1
+#define NPY_HAVE_COMPLEX_LONG_DOUBLE 1
+#define NPY_USE_C99_FORMATS 1
+#define NPY_VISIBILITY_HIDDEN __attribute__((visibility("hidden")))
+#define NPY_ABI_VERSION 0x01000009
+#define NPY_API_VERSION 0x0000000A
+
+#ifndef __STDC_FORMAT_MACROS
+#define __STDC_FORMAT_MACROS 1
+#endif
diff --git a/meta-arago-distro/recipes-devtools/python-numpy/files/powerpc/config.h b/meta-arago-distro/recipes-devtools/python-numpy/files/powerpc/config.h
new file mode 100644
index 0000000..f65d39d
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/python-numpy/files/powerpc/config.h
@@ -0,0 +1,139 @@
+#define HAVE_ENDIAN_H 1
+#define SIZEOF_PY_INTPTR_T 4
+#define SIZEOF_PY_LONG_LONG 8
+#define MATHLIB m
+#define HAVE_SIN 1
+#define HAVE_COS 1
+#define HAVE_TAN 1
+#define HAVE_SINH 1
+#define HAVE_COSH 1
+#define HAVE_TANH 1
+#define HAVE_FABS 1
+#define HAVE_FLOOR 1
+#define HAVE_CEIL 1
+#define HAVE_SQRT 1
+#define HAVE_LOG10 1
+#define HAVE_LOG 1
+#define HAVE_EXP 1
+#define HAVE_ASIN 1
+#define HAVE_ACOS 1
+#define HAVE_ATAN 1
+#define HAVE_FMOD 1
+#define HAVE_MODF 1
+#define HAVE_FREXP 1
+#define HAVE_LDEXP 1
+#define HAVE_RINT 1
+#define HAVE_TRUNC 1
+#define HAVE_EXP2 1
+#define HAVE_LOG2 1
+#define HAVE_ATAN2 1
+#define HAVE_POW 1
+#define HAVE_NEXTAFTER 1
+#define HAVE_SINF 1
+#define HAVE_COSF 1
+#define HAVE_TANF 1
+#define HAVE_SINHF 1
+#define HAVE_COSHF 1
+#define HAVE_TANHF 1
+#define HAVE_FABSF 1
+#define HAVE_FLOORF 1
+#define HAVE_CEILF 1
+#define HAVE_RINTF 1
+#define HAVE_TRUNCF 1
+#define HAVE_SQRTF 1
+#define HAVE_LOG10F 1
+#define HAVE_LOGF 1
+#define HAVE_LOG1PF 1
+#define HAVE_EXPF 1
+#define HAVE_EXPM1F 1
+#define HAVE_ASINF 1
+#define HAVE_ACOSF 1
+#define HAVE_ATANF 1
+#define HAVE_ASINHF 1
+#define HAVE_ACOSHF 1
+#define HAVE_ATANHF 1
+#define HAVE_HYPOTF 1
+#define HAVE_ATAN2F 1
+#define HAVE_POWF 1
+#define HAVE_FMODF 1
+#define HAVE_MODFF 1
+#define HAVE_FREXPF 1
+#define HAVE_LDEXPF 1
+#define HAVE_EXP2F 1
+#define HAVE_LOG2F 1
+#define HAVE_COPYSIGNF 1
+#define HAVE_NEXTAFTERF 1
+#define HAVE_SINL 1
+#define HAVE_COSL 1
+#define HAVE_TANL 1
+#define HAVE_SINHL 1
+#define HAVE_COSHL 1
+#define HAVE_TANHL 1
+#define HAVE_FABSL 1
+#define HAVE_FLOORL 1
+#define HAVE_CEILL 1
+#define HAVE_RINTL 1
+#define HAVE_TRUNCL 1
+#define HAVE_SQRTL 1
+#define HAVE_LOG10L 1
+#define HAVE_LOGL 1
+#define HAVE_LOG1PL 1
+#define HAVE_EXPL 1
+#define HAVE_EXPM1L 1
+#define HAVE_ASINL 1
+#define HAVE_ACOSL 1
+#define HAVE_ATANL 1
+#define HAVE_ASINHL 1
+#define HAVE_ACOSHL 1
+#define HAVE_ATANHL 1
+#define HAVE_HYPOTL 1
+#define HAVE_ATAN2L 1
+#define HAVE_POWL 1
+#define HAVE_FMODL 1
+#define HAVE_MODFL 1
+#define HAVE_FREXPL 1
+#define HAVE_LDEXPL 1
+#define HAVE_EXP2L 1
+#define HAVE_LOG2L 1
+#define HAVE_COPYSIGNL 1
+#define HAVE_NEXTAFTERL 1
+#define HAVE_DECL_SIGNBIT
+#define HAVE_COMPLEX_H 1
+#define HAVE_CREAL 1
+#define HAVE_CIMAG 1
+#define HAVE_CABS 1
+#define HAVE_CARG 1
+#define HAVE_CEXP 1
+#define HAVE_CSQRT 1
+#define HAVE_CLOG 1
+#define HAVE_CCOS 1
+#define HAVE_CSIN 1
+#define HAVE_CPOW 1
+#define HAVE_CREALF 1
+#define HAVE_CIMAGF 1
+#define HAVE_CABSF 1
+#define HAVE_CARGF 1
+#define HAVE_CEXPF 1
+#define HAVE_CSQRTF 1
+#define HAVE_CLOGF 1
+#define HAVE_CCOSF 1
+#define HAVE_CSINF 1
+#define HAVE_CPOWF 1
+#define HAVE_CREALL 1
+#define HAVE_CIMAGL 1
+#define HAVE_CABSL 1
+#define HAVE_CARGL 1
+#define HAVE_CEXPL 1
+#define HAVE_CSQRTL 1
+#define HAVE_CLOGL 1
+#define HAVE_CCOSL 1
+#define HAVE_CSINL 1
+#define HAVE_CPOWL 1
+#define HAVE_LDOUBLE_DOUBLE_DOUBLE_BE 1
+#ifndef __cplusplus
+/* #undef inline */
+#endif
+
+#ifndef _NPY_NPY_CONFIG_H_
+#error config.h should never be included directly, include npy_config.h instead
+#endif
diff --git a/meta-arago-distro/recipes-devtools/python-numpy/files/powerpc64/_numpyconfig.h b/meta-arago-distro/recipes-devtools/python-numpy/files/powerpc64/_numpyconfig.h
new file mode 100644
index 0000000..debb390
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/python-numpy/files/powerpc64/_numpyconfig.h
@@ -0,0 +1,32 @@
+#define NPY_HAVE_ENDIAN_H 1
+#define NPY_SIZEOF_SHORT SIZEOF_SHORT
+#define NPY_SIZEOF_INT SIZEOF_INT
+#define NPY_SIZEOF_LONG SIZEOF_LONG
+#define NPY_SIZEOF_FLOAT 4
+#define NPY_SIZEOF_COMPLEX_FLOAT 8
+#define NPY_SIZEOF_DOUBLE 8
+#define NPY_SIZEOF_COMPLEX_DOUBLE 16
+#define NPY_SIZEOF_LONGDOUBLE 16
+#define NPY_SIZEOF_COMPLEX_LONGDOUBLE 32
+#define NPY_ENABLE_SEPARATE_COMPILATION 1
+#define NPY_SIZEOF_PY_INTPTR_T 8
+#define NPY_SIZEOF_PY_LONG_LONG 8
+#define NPY_SIZEOF_LONGLONG 8
+#define NPY_SIZEOF_OFF_T 8
+#define NPY_NO_SMP 0
+#define NPY_HAVE_DECL_ISNAN
+#define NPY_HAVE_DECL_ISINF
+#define NPY_HAVE_DECL_ISFINITE
+#define NPY_HAVE_DECL_SIGNBIT
+#define NPY_USE_C99_COMPLEX 1
+#define NPY_HAVE_COMPLEX_DOUBLE 1
+#define NPY_HAVE_COMPLEX_FLOAT 1
+#define NPY_HAVE_COMPLEX_LONG_DOUBLE 1
+#define NPY_USE_C99_FORMATS 1
+#define NPY_VISIBILITY_HIDDEN __attribute__((visibility("hidden")))
+#define NPY_ABI_VERSION 0x01000009
+#define NPY_API_VERSION 0x0000000A
+
+#ifndef __STDC_FORMAT_MACROS
+#define __STDC_FORMAT_MACROS 1
+#endif
diff --git a/meta-arago-distro/recipes-devtools/python-numpy/files/powerpc64/config.h b/meta-arago-distro/recipes-devtools/python-numpy/files/powerpc64/config.h
new file mode 100644
index 0000000..c30b868
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/python-numpy/files/powerpc64/config.h
@@ -0,0 +1,139 @@
+#define HAVE_ENDIAN_H 1
+#define SIZEOF_PY_INTPTR_T 8
+#define SIZEOF_PY_LONG_LONG 8
+#define MATHLIB m
+#define HAVE_SIN 1
+#define HAVE_COS 1
+#define HAVE_TAN 1
+#define HAVE_SINH 1
+#define HAVE_COSH 1
+#define HAVE_TANH 1
+#define HAVE_FABS 1
+#define HAVE_FLOOR 1
+#define HAVE_CEIL 1
+#define HAVE_SQRT 1
+#define HAVE_LOG10 1
+#define HAVE_LOG 1
+#define HAVE_EXP 1
+#define HAVE_ASIN 1
+#define HAVE_ACOS 1
+#define HAVE_ATAN 1
+#define HAVE_FMOD 1
+#define HAVE_MODF 1
+#define HAVE_FREXP 1
+#define HAVE_LDEXP 1
+#define HAVE_RINT 1
+#define HAVE_TRUNC 1
+#define HAVE_EXP2 1
+#define HAVE_LOG2 1
+#define HAVE_ATAN2 1
+#define HAVE_POW 1
+#define HAVE_NEXTAFTER 1
+#define HAVE_SINF 1
+#define HAVE_COSF 1
+#define HAVE_TANF 1
+#define HAVE_SINHF 1
+#define HAVE_COSHF 1
+#define HAVE_TANHF 1
+#define HAVE_FABSF 1
+#define HAVE_FLOORF 1
+#define HAVE_CEILF 1
+#define HAVE_RINTF 1
+#define HAVE_TRUNCF 1
+#define HAVE_SQRTF 1
+#define HAVE_LOG10F 1
+#define HAVE_LOGF 1
+#define HAVE_LOG1PF 1
+#define HAVE_EXPF 1
+#define HAVE_EXPM1F 1
+#define HAVE_ASINF 1
+#define HAVE_ACOSF 1
+#define HAVE_ATANF 1
+#define HAVE_ASINHF 1
+#define HAVE_ACOSHF 1
+#define HAVE_ATANHF 1
+#define HAVE_HYPOTF 1
+#define HAVE_ATAN2F 1
+#define HAVE_POWF 1
+#define HAVE_FMODF 1
+#define HAVE_MODFF 1
+#define HAVE_FREXPF 1
+#define HAVE_LDEXPF 1
+#define HAVE_EXP2F 1
+#define HAVE_LOG2F 1
+#define HAVE_COPYSIGNF 1
+#define HAVE_NEXTAFTERF 1
+#define HAVE_SINL 1
+#define HAVE_COSL 1
+#define HAVE_TANL 1
+#define HAVE_SINHL 1
+#define HAVE_COSHL 1
+#define HAVE_TANHL 1
+#define HAVE_FABSL 1
+#define HAVE_FLOORL 1
+#define HAVE_CEILL 1
+#define HAVE_RINTL 1
+#define HAVE_TRUNCL 1
+#define HAVE_SQRTL 1
+#define HAVE_LOG10L 1
+#define HAVE_LOGL 1
+#define HAVE_LOG1PL 1
+#define HAVE_EXPL 1
+#define HAVE_EXPM1L 1
+#define HAVE_ASINL 1
+#define HAVE_ACOSL 1
+#define HAVE_ATANL 1
+#define HAVE_ASINHL 1
+#define HAVE_ACOSHL 1
+#define HAVE_ATANHL 1
+#define HAVE_HYPOTL 1
+#define HAVE_ATAN2L 1
+#define HAVE_POWL 1
+#define HAVE_FMODL 1
+#define HAVE_MODFL 1
+#define HAVE_FREXPL 1
+#define HAVE_LDEXPL 1
+#define HAVE_EXP2L 1
+#define HAVE_LOG2L 1
+#define HAVE_COPYSIGNL 1
+#define HAVE_NEXTAFTERL 1
+#define HAVE_DECL_SIGNBIT
+#define HAVE_COMPLEX_H 1
+#define HAVE_CREAL 1
+#define HAVE_CIMAG 1
+#define HAVE_CABS 1
+#define HAVE_CARG 1
+#define HAVE_CEXP 1
+#define HAVE_CSQRT 1
+#define HAVE_CLOG 1
+#define HAVE_CCOS 1
+#define HAVE_CSIN 1
+#define HAVE_CPOW 1
+#define HAVE_CREALF 1
+#define HAVE_CIMAGF 1
+#define HAVE_CABSF 1
+#define HAVE_CARGF 1
+#define HAVE_CEXPF 1
+#define HAVE_CSQRTF 1
+#define HAVE_CLOGF 1
+#define HAVE_CCOSF 1
+#define HAVE_CSINF 1
+#define HAVE_CPOWF 1
+#define HAVE_CREALL 1
+#define HAVE_CIMAGL 1
+#define HAVE_CABSL 1
+#define HAVE_CARGL 1
+#define HAVE_CEXPL 1
+#define HAVE_CSQRTL 1
+#define HAVE_CLOGL 1
+#define HAVE_CCOSL 1
+#define HAVE_CSINL 1
+#define HAVE_CPOWL 1
+#define HAVE_LDOUBLE_IEEE_QUAD_LE 1
+#ifndef __cplusplus
+/* #undef inline */
+#endif
+
+#ifndef _NPY_NPY_CONFIG_H_
+#error config.h should never be included directly, include npy_config.h instead
+#endif
diff --git a/meta-arago-distro/recipes-devtools/python-numpy/files/riscv64/_numpyconfig.h b/meta-arago-distro/recipes-devtools/python-numpy/files/riscv64/_numpyconfig.h
new file mode 100644
index 0000000..109deb0
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/python-numpy/files/riscv64/_numpyconfig.h
@@ -0,0 +1,32 @@
+#define NPY_HAVE_ENDIAN_H 1
+#define NPY_SIZEOF_SHORT SIZEOF_SHORT
+#define NPY_SIZEOF_INT SIZEOF_INT
+#define NPY_SIZEOF_LONG SIZEOF_LONG
+#define NPY_SIZEOF_FLOAT 4
+#define NPY_SIZEOF_COMPLEX_FLOAT 8
+#define NPY_SIZEOF_DOUBLE 8
+#define NPY_SIZEOF_COMPLEX_DOUBLE 16
+#define NPY_SIZEOF_LONGDOUBLE 16
+#define NPY_SIZEOF_COMPLEX_LONGDOUBLE 32
+#define NPY_SIZEOF_PY_INTPTR_T 8
+#define NPY_SIZEOF_PY_LONG_LONG 8
+#define NPY_SIZEOF_LONGLONG 8
+#define NPY_SIZEOF_OFF_T 8
+#define NPY_NO_SMP 0
+#define NPY_HAVE_DECL_ISNAN
+#define NPY_HAVE_DECL_ISINF
+#define NPY_HAVE_DECL_ISFINITE
+#define NPY_HAVE_DECL_SIGNBIT
+#define NPY_USE_C99_COMPLEX 1
+#define NPY_HAVE_COMPLEX_DOUBLE 1
+#define NPY_HAVE_COMPLEX_FLOAT 1
+#define NPY_HAVE_COMPLEX_LONG_DOUBLE 1
+#define NPY_ENABLE_SEPARATE_COMPILATION 1
+#define NPY_USE_C99_FORMATS 1
+#define NPY_VISIBILITY_HIDDEN __attribute__((visibility("hidden")))
+#define NPY_ABI_VERSION 0x01000009
+#define NPY_API_VERSION 0x0000000A
+
+#ifndef __STDC_FORMAT_MACROS
+#define __STDC_FORMAT_MACROS 1
+#endif
diff --git a/meta-arago-distro/recipes-devtools/python-numpy/files/riscv64/config.h b/meta-arago-distro/recipes-devtools/python-numpy/files/riscv64/config.h
new file mode 100644
index 0000000..c30b868
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/python-numpy/files/riscv64/config.h
@@ -0,0 +1,139 @@
+#define HAVE_ENDIAN_H 1
+#define SIZEOF_PY_INTPTR_T 8
+#define SIZEOF_PY_LONG_LONG 8
+#define MATHLIB m
+#define HAVE_SIN 1
+#define HAVE_COS 1
+#define HAVE_TAN 1
+#define HAVE_SINH 1
+#define HAVE_COSH 1
+#define HAVE_TANH 1
+#define HAVE_FABS 1
+#define HAVE_FLOOR 1
+#define HAVE_CEIL 1
+#define HAVE_SQRT 1
+#define HAVE_LOG10 1
+#define HAVE_LOG 1
+#define HAVE_EXP 1
+#define HAVE_ASIN 1
+#define HAVE_ACOS 1
+#define HAVE_ATAN 1
+#define HAVE_FMOD 1
+#define HAVE_MODF 1
+#define HAVE_FREXP 1
+#define HAVE_LDEXP 1
+#define HAVE_RINT 1
+#define HAVE_TRUNC 1
+#define HAVE_EXP2 1
+#define HAVE_LOG2 1
+#define HAVE_ATAN2 1
+#define HAVE_POW 1
+#define HAVE_NEXTAFTER 1
+#define HAVE_SINF 1
+#define HAVE_COSF 1
+#define HAVE_TANF 1
+#define HAVE_SINHF 1
+#define HAVE_COSHF 1
+#define HAVE_TANHF 1
+#define HAVE_FABSF 1
+#define HAVE_FLOORF 1
+#define HAVE_CEILF 1
+#define HAVE_RINTF 1
+#define HAVE_TRUNCF 1
+#define HAVE_SQRTF 1
+#define HAVE_LOG10F 1
+#define HAVE_LOGF 1
+#define HAVE_LOG1PF 1
+#define HAVE_EXPF 1
+#define HAVE_EXPM1F 1
+#define HAVE_ASINF 1
+#define HAVE_ACOSF 1
+#define HAVE_ATANF 1
+#define HAVE_ASINHF 1
+#define HAVE_ACOSHF 1
+#define HAVE_ATANHF 1
+#define HAVE_HYPOTF 1
+#define HAVE_ATAN2F 1
+#define HAVE_POWF 1
+#define HAVE_FMODF 1
+#define HAVE_MODFF 1
+#define HAVE_FREXPF 1
+#define HAVE_LDEXPF 1
+#define HAVE_EXP2F 1
+#define HAVE_LOG2F 1
+#define HAVE_COPYSIGNF 1
+#define HAVE_NEXTAFTERF 1
+#define HAVE_SINL 1
+#define HAVE_COSL 1
+#define HAVE_TANL 1
+#define HAVE_SINHL 1
+#define HAVE_COSHL 1
+#define HAVE_TANHL 1
+#define HAVE_FABSL 1
+#define HAVE_FLOORL 1
+#define HAVE_CEILL 1
+#define HAVE_RINTL 1
+#define HAVE_TRUNCL 1
+#define HAVE_SQRTL 1
+#define HAVE_LOG10L 1
+#define HAVE_LOGL 1
+#define HAVE_LOG1PL 1
+#define HAVE_EXPL 1
+#define HAVE_EXPM1L 1
+#define HAVE_ASINL 1
+#define HAVE_ACOSL 1
+#define HAVE_ATANL 1
+#define HAVE_ASINHL 1
+#define HAVE_ACOSHL 1
+#define HAVE_ATANHL 1
+#define HAVE_HYPOTL 1
+#define HAVE_ATAN2L 1
+#define HAVE_POWL 1
+#define HAVE_FMODL 1
+#define HAVE_MODFL 1
+#define HAVE_FREXPL 1
+#define HAVE_LDEXPL 1
+#define HAVE_EXP2L 1
+#define HAVE_LOG2L 1
+#define HAVE_COPYSIGNL 1
+#define HAVE_NEXTAFTERL 1
+#define HAVE_DECL_SIGNBIT
+#define HAVE_COMPLEX_H 1
+#define HAVE_CREAL 1
+#define HAVE_CIMAG 1
+#define HAVE_CABS 1
+#define HAVE_CARG 1
+#define HAVE_CEXP 1
+#define HAVE_CSQRT 1
+#define HAVE_CLOG 1
+#define HAVE_CCOS 1
+#define HAVE_CSIN 1
+#define HAVE_CPOW 1
+#define HAVE_CREALF 1
+#define HAVE_CIMAGF 1
+#define HAVE_CABSF 1
+#define HAVE_CARGF 1
+#define HAVE_CEXPF 1
+#define HAVE_CSQRTF 1
+#define HAVE_CLOGF 1
+#define HAVE_CCOSF 1
+#define HAVE_CSINF 1
+#define HAVE_CPOWF 1
+#define HAVE_CREALL 1
+#define HAVE_CIMAGL 1
+#define HAVE_CABSL 1
+#define HAVE_CARGL 1
+#define HAVE_CEXPL 1
+#define HAVE_CSQRTL 1
+#define HAVE_CLOGL 1
+#define HAVE_CCOSL 1
+#define HAVE_CSINL 1
+#define HAVE_CPOWL 1
+#define HAVE_LDOUBLE_IEEE_QUAD_LE 1
+#ifndef __cplusplus
+/* #undef inline */
+#endif
+
+#ifndef _NPY_NPY_CONFIG_H_
+#error config.h should never be included directly, include npy_config.h instead
+#endif
diff --git a/meta-arago-distro/recipes-devtools/python-numpy/files/x86-64/_numpyconfig.h b/meta-arago-distro/recipes-devtools/python-numpy/files/x86-64/_numpyconfig.h
new file mode 100644
index 0000000..b330361
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/python-numpy/files/x86-64/_numpyconfig.h
@@ -0,0 +1,32 @@
+#define NPY_HAVE_ENDIAN_H 1
+#define NPY_SIZEOF_SHORT SIZEOF_SHORT
+#define NPY_SIZEOF_INT SIZEOF_INT
+#define NPY_SIZEOF_LONG SIZEOF_LONG
+#define NPY_SIZEOF_FLOAT 4
+#define NPY_SIZEOF_COMPLEX_FLOAT 8
+#define NPY_SIZEOF_DOUBLE 8
+#define NPY_SIZEOF_OFF_T 8
+#define NPY_SIZEOF_COMPLEX_DOUBLE 16
+#define NPY_SIZEOF_LONGDOUBLE 16
+#define NPY_SIZEOF_COMPLEX_LONGDOUBLE 32
+#define NPY_ENABLE_SEPARATE_COMPILATION 1
+#define NPY_SIZEOF_PY_INTPTR_T 8
+#define NPY_SIZEOF_PY_LONG_LONG 8
+#define NPY_SIZEOF_LONGLONG 8
+#define NPY_NO_SMP 0
+#define NPY_HAVE_DECL_ISNAN
+#define NPY_HAVE_DECL_ISINF
+#define NPY_HAVE_DECL_ISFINITE
+#define NPY_HAVE_DECL_SIGNBIT
+#define NPY_USE_C99_COMPLEX 1
+#define NPY_HAVE_COMPLEX_DOUBLE 1
+#define NPY_HAVE_COMPLEX_FLOAT 1
+#define NPY_HAVE_COMPLEX_LONG_DOUBLE 1
+#define NPY_USE_C99_FORMATS 1
+#define NPY_VISIBILITY_HIDDEN __attribute__((visibility("hidden")))
+#define NPY_ABI_VERSION 0x01000009
+#define NPY_API_VERSION 0x0000000A
+
+#ifndef __STDC_FORMAT_MACROS
+#define __STDC_FORMAT_MACROS 1
+#endif
diff --git a/meta-arago-distro/recipes-devtools/python-numpy/files/x86-64/config.h b/meta-arago-distro/recipes-devtools/python-numpy/files/x86-64/config.h
new file mode 100644
index 0000000..0ce63b7
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/python-numpy/files/x86-64/config.h
@@ -0,0 +1,139 @@
+#define HAVE_ENDIAN_H 1
+#define SIZEOF_PY_INTPTR_T 8
+#define SIZEOF_PY_LONG_LONG 8
+#define MATHLIB m
+#define HAVE_SIN 1
+#define HAVE_COS 1
+#define HAVE_TAN 1
+#define HAVE_SINH 1
+#define HAVE_COSH 1
+#define HAVE_TANH 1
+#define HAVE_FABS 1
+#define HAVE_FLOOR 1
+#define HAVE_CEIL 1
+#define HAVE_SQRT 1
+#define HAVE_LOG10 1
+#define HAVE_LOG 1
+#define HAVE_EXP 1
+#define HAVE_ASIN 1
+#define HAVE_ACOS 1
+#define HAVE_ATAN 1
+#define HAVE_FMOD 1
+#define HAVE_MODF 1
+#define HAVE_FREXP 1
+#define HAVE_LDEXP 1
+#define HAVE_RINT 1
+#define HAVE_TRUNC 1
+#define HAVE_EXP2 1
+#define HAVE_LOG2 1
+#define HAVE_ATAN2 1
+#define HAVE_POW 1
+#define HAVE_NEXTAFTER 1
+#define HAVE_SINF 1
+#define HAVE_COSF 1
+#define HAVE_TANF 1
+#define HAVE_SINHF 1
+#define HAVE_COSHF 1
+#define HAVE_TANHF 1
+#define HAVE_FABSF 1
+#define HAVE_FLOORF 1
+#define HAVE_CEILF 1
+#define HAVE_RINTF 1
+#define HAVE_TRUNCF 1
+#define HAVE_SQRTF 1
+#define HAVE_LOG10F 1
+#define HAVE_LOGF 1
+#define HAVE_LOG1PF 1
+#define HAVE_EXPF 1
+#define HAVE_EXPM1F 1
+#define HAVE_ASINF 1
+#define HAVE_ACOSF 1
+#define HAVE_ATANF 1
+#define HAVE_ASINHF 1
+#define HAVE_ACOSHF 1
+#define HAVE_ATANHF 1
+#define HAVE_HYPOTF 1
+#define HAVE_ATAN2F 1
+#define HAVE_POWF 1
+#define HAVE_FMODF 1
+#define HAVE_MODFF 1
+#define HAVE_FREXPF 1
+#define HAVE_LDEXPF 1
+#define HAVE_EXP2F 1
+#define HAVE_LOG2F 1
+#define HAVE_COPYSIGNF 1
+#define HAVE_NEXTAFTERF 1
+#define HAVE_SINL 1
+#define HAVE_COSL 1
+#define HAVE_TANL 1
+#define HAVE_SINHL 1
+#define HAVE_COSHL 1
+#define HAVE_TANHL 1
+#define HAVE_FABSL 1
+#define HAVE_FLOORL 1
+#define HAVE_CEILL 1
+#define HAVE_RINTL 1
+#define HAVE_TRUNCL 1
+#define HAVE_SQRTL 1
+#define HAVE_LOG10L 1
+#define HAVE_LOGL 1
+#define HAVE_LOG1PL 1
+#define HAVE_EXPL 1
+#define HAVE_EXPM1L 1
+#define HAVE_ASINL 1
+#define HAVE_ACOSL 1
+#define HAVE_ATANL 1
+#define HAVE_ASINHL 1
+#define HAVE_ACOSHL 1
+#define HAVE_ATANHL 1
+#define HAVE_HYPOTL 1
+#define HAVE_ATAN2L 1
+#define HAVE_POWL 1
+#define HAVE_FMODL 1
+#define HAVE_MODFL 1
+#define HAVE_FREXPL 1
+#define HAVE_LDEXPL 1
+#define HAVE_EXP2L 1
+#define HAVE_LOG2L 1
+#define HAVE_COPYSIGNL 1
+#define HAVE_NEXTAFTERL 1
+#define HAVE_DECL_SIGNBIT
+#define HAVE_COMPLEX_H 1
+#define HAVE_CREAL 1
+#define HAVE_CIMAG 1
+#define HAVE_CABS 1
+#define HAVE_CARG 1
+#define HAVE_CEXP 1
+#define HAVE_CSQRT 1
+#define HAVE_CLOG 1
+#define HAVE_CCOS 1
+#define HAVE_CSIN 1
+#define HAVE_CPOW 1
+#define HAVE_CREALF 1
+#define HAVE_CIMAGF 1
+#define HAVE_CABSF 1
+#define HAVE_CARGF 1
+#define HAVE_CEXPF 1
+#define HAVE_CSQRTF 1
+#define HAVE_CLOGF 1
+#define HAVE_CCOSF 1
+#define HAVE_CSINF 1
+#define HAVE_CPOWF 1
+#define HAVE_CREALL 1
+#define HAVE_CIMAGL 1
+#define HAVE_CABSL 1
+#define HAVE_CARGL 1
+#define HAVE_CEXPL 1
+#define HAVE_CSQRTL 1
+#define HAVE_CLOGL 1
+#define HAVE_CCOSL 1
+#define HAVE_CSINL 1
+#define HAVE_CPOWL 1
+#define HAVE_LDOUBLE_INTEL_EXTENDED_16_BYTES_LE 1
+#ifndef __cplusplus
+/* #undef inline */
+#endif
+
+#ifndef _NPY_NPY_CONFIG_H_
+#error config.h should never be included directly, include npy_config.h instead
+#endif
diff --git a/meta-arago-distro/recipes-devtools/python-numpy/files/x86/config.h b/meta-arago-distro/recipes-devtools/python-numpy/files/x86/config.h
new file mode 100644
index 0000000..08e41e3
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/python-numpy/files/x86/config.h
@@ -0,0 +1,108 @@
+#define SIZEOF_PY_INTPTR_T 4
+#define SIZEOF_PY_LONG_LONG 8
+#define MATHLIB m
+#define HAVE_SIN
+#define HAVE_COS
+#define HAVE_TAN
+#define HAVE_SINH
+#define HAVE_COSH
+#define HAVE_TANH
+#define HAVE_FABS
+#define HAVE_FLOOR
+#define HAVE_CEIL
+#define HAVE_SQRT
+#define HAVE_LOG10
+#define HAVE_LOG
+#define HAVE_EXP
+#define HAVE_ASIN
+#define HAVE_ACOS
+#define HAVE_ATAN
+#define HAVE_FMOD
+#define HAVE_MODF
+#define HAVE_FREXP
+#define HAVE_LDEXP
+#define HAVE_RINT
+#define HAVE_TRUNC
+#define HAVE_EXP2
+#define HAVE_LOG2
+#define HAVE_ATAN2
+#define HAVE_POW
+#define HAVE_NEXTAFTER
+#define HAVE_SINF
+#define HAVE_COSF
+#define HAVE_TANF
+#define HAVE_SINHF
+#define HAVE_COSHF
+#define HAVE_TANHF
+#define HAVE_FABSF
+#define HAVE_FLOORF
+#define HAVE_CEILF
+#define HAVE_RINTF
+#define HAVE_TRUNCF
+#define HAVE_SQRTF
+#define HAVE_LOG10F
+#define HAVE_LOGF
+#define HAVE_LOG1PF
+#define HAVE_EXPF
+#define HAVE_EXPM1F
+#define HAVE_ASINF
+#define HAVE_ACOSF
+#define HAVE_ATANF
+#define HAVE_ASINHF
+#define HAVE_ACOSHF
+#define HAVE_ATANHF
+#define HAVE_HYPOTF
+#define HAVE_ATAN2F
+#define HAVE_POWF
+#define HAVE_FMODF
+#define HAVE_MODFF
+#define HAVE_FREXPF
+#define HAVE_LDEXPF
+#define HAVE_EXP2F
+#define HAVE_LOG2F
+#define HAVE_COPYSIGNF
+#define HAVE_NEXTAFTERF
+#define HAVE_SINL
+#define HAVE_COSL
+#define HAVE_TANL
+#define HAVE_SINHL
+#define HAVE_COSHL
+#define HAVE_TANHL
+#define HAVE_FABSL
+#define HAVE_FLOORL
+#define HAVE_CEILL
+#define HAVE_RINTL
+#define HAVE_TRUNCL
+#define HAVE_SQRTL
+#define HAVE_LOG10L
+#define HAVE_LOGL
+#define HAVE_LOG1PL
+#define HAVE_EXPL
+#define HAVE_EXPM1L
+#define HAVE_ASINL
+#define HAVE_ACOSL
+#define HAVE_ATANL
+#define HAVE_ASINHL
+#define HAVE_ACOSHL
+#define HAVE_ATANHL
+#define HAVE_HYPOTL
+#define HAVE_ATAN2L
+#define HAVE_POWL
+#define HAVE_FMODL
+#define HAVE_MODFL
+#define HAVE_FREXPL
+#define HAVE_LDEXPL
+#define HAVE_EXP2L
+#define HAVE_LOG2L
+#define HAVE_COPYSIGNL
+#define HAVE_NEXTAFTERL
+#define HAVE_DECL_SIGNBIT
+#define HAVE_COMPLEX_H
+#define HAVE_LDOUBLE_INTEL_EXTENDED_12_BYTES_LE 1
+#ifndef __cplusplus
+/* #undef inline */
+#endif
+
+#ifndef _NPY_NPY_CONFIG_H_
+#error config.h should never be included directly, include npy_config.h instead
+#endif
diff --git a/meta-arago-distro/recipes-devtools/python-numpy/files/x86/numpyconfig.h b/meta-arago-distro/recipes-devtools/python-numpy/files/x86/numpyconfig.h
new file mode 100644
index 0000000..ff7938c
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/python-numpy/files/x86/numpyconfig.h
@@ -0,0 +1,24 @@
+#ifndef _NPY_NUMPYCONFIG_H_
+#define _NPY_NUMPYCONFIG_H_
+
+#include "_numpyconfig.h"
+
+/* 
+ * On Mac OS X, because there is only one configuration stage for all the archs
+ * in universal builds, any macro which depends on the arch needs to be
+ * harcoded
+ */
+#ifdef __APPLE__
+	#undef NPY_SIZEOF_LONG
+	#undef NPY_SIZEOF_PY_INTPTR_T
+
+	#ifdef __LP64__
+		#define NPY_SIZEOF_LONG 		8
+		#define NPY_SIZEOF_PY_INTPTR_T 	8
+	#else
+		#define NPY_SIZEOF_LONG 		4
+		#define NPY_SIZEOF_PY_INTPTR_T 	4
+	#endif
+#endif
+
+#endif
diff --git a/meta-arago-distro/recipes-devtools/python-numpy/python-numpy.inc b/meta-arago-distro/recipes-devtools/python-numpy/python-numpy.inc
new file mode 100644
index 0000000..43c3053
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/python-numpy/python-numpy.inc
@@ -0,0 +1,116 @@
+SUMMARY = "A sophisticated Numeric Processing Package for Python"
+SECTION = "devel/python"
+LICENSE = "BSD-3-Clause & BSD-2-Clause & PSF & Apache-2.0 & BSD"
+LIC_FILES_CHKSUM = "file://LICENSE.txt;md5=d26bde5432613cce2334b93985576231"
+
+SRCNAME = "numpy"
+
+SRC_URI = "https://github.com/${SRCNAME}/${SRCNAME}/releases/download/v${PV}/${SRCNAME}-${PV}.tar.gz \
+           file://0001-Don-t-search-usr-and-so-on-for-libraries-by-default-.patch \
+           file://0001-npy_cpu-Add-riscv-support.patch \
+           ${CONFIGFILESURI} \
+           "
+SRC_URI[md5sum] = "0886e5b5017f08f2b7a624c0b5931e61"
+SRC_URI[sha256sum] = "adf063a3f87ab89393f5eea0eb903293b112fa0a308e8c594a75ffa585d81d4f"
+
+UPSTREAM_CHECK_URI = "https://github.com/numpy/numpy/releases"
+UPSTREAM_CHECK_REGEX = "(?P<pver>\d+(\.\d+)+)\.tar"
+
+CONFIGFILESURI ?= ""
+
+CONFIGFILESURI_aarch64 = " \
+    file://config.h \
+    file://_numpyconfig.h \
+"
+CONFIGFILESURI_arm = " \
+    file://config.h \
+    file://numpyconfig.h \
+"
+CONFIGFILESURI_armeb = " \
+    file://config.h \
+    file://numpyconfig.h \
+"
+CONFIGFILESURI_mipsarcho32el = " \
+    file://config.h \
+    file://numpyconfig.h \
+"
+CONFIGFILESURI_x86 = " \
+    file://config.h \
+    file://numpyconfig.h \
+"
+CONFIGFILESURI_x86-64 = " \
+    file://config.h \
+    file://_numpyconfig.h \
+"
+CONFIGFILESURI_mipsarcho32eb = " \
+    file://config.h \
+    file://_numpyconfig.h \
+"
+CONFIGFILESURI_powerpc = " \
+    file://config.h \
+    file://_numpyconfig.h \
+"
+CONFIGFILESURI_powerpc64 = " \
+    file://config.h \
+    file://_numpyconfig.h \
+"
+CONFIGFILESURI_mipsarchn64eb = " \
+    file://config.h \
+    file://_numpyconfig.h \
+"
+CONFIGFILESURI_mipsarchn64el = " \
+    file://config.h \
+    file://_numpyconfig.h \
+"
+CONFIGFILESURI_mipsarchn32eb = " \
+    file://config.h \
+    file://_numpyconfig.h \
+"
+CONFIGFILESURI_mipsarchn32el = " \
+    file://config.h \
+    file://_numpyconfig.h \
+"
+CONFIGFILESURI_riscv64 = " \
+    file://config.h \
+    file://_numpyconfig.h \
+"
+
+S = "${WORKDIR}/numpy-${PV}"
+
+CLEANBROKEN = "1"
+
+# Make the build fail and replace *config.h with proper one
+# This is a ugly, ugly hack - Koen
+do_compile_prepend_class-target() {
+    ${STAGING_BINDIR_NATIVE}/${PYTHON_PN}-native/${PYTHON_PN} setup.py build ${DISTUTILS_BUILD_ARGS} || \
+    true
+    cp ${WORKDIR}/*config.h ${S}/build/$(ls ${S}/build | grep src)/numpy/core/include/numpy/
+}
+
+FILES_${PN}-staticdev += "${PYTHON_SITEPACKAGES_DIR}/numpy/core/lib/*.a"
+
+# install what is needed for numpy.test()
+RDEPENDS_${PN} = "${PYTHON_PN}-unittest \
+                  ${PYTHON_PN}-difflib \
+                  ${PYTHON_PN}-pprint \
+                  ${PYTHON_PN}-pickle \
+                  ${PYTHON_PN}-shell \
+                  ${PYTHON_PN}-nose \
+                  ${PYTHON_PN}-doctest \
+                  ${PYTHON_PN}-datetime \
+                  ${PYTHON_PN}-distutils \
+                  ${PYTHON_PN}-misc \
+                  ${PYTHON_PN}-mmap \
+                  ${PYTHON_PN}-netclient \
+                  ${PYTHON_PN}-numbers \
+                  ${PYTHON_PN}-pydoc \
+                  ${PYTHON_PN}-pkgutil \
+                  ${PYTHON_PN}-email \
+                  ${PYTHON_PN}-compression \
+                  ${PYTHON_PN}-ctypes \
+                  ${PYTHON_PN}-threading \
+"
+
+RDEPENDS_${PN}_class-native = ""
+
+BBCLASSEXTEND = "native nativesdk"
diff --git a/meta-arago-distro/recipes-devtools/python-numpy/python-numpy_1.16.3.bb b/meta-arago-distro/recipes-devtools/python-numpy/python-numpy_1.16.3.bb
new file mode 100644
index 0000000..a1133da
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/python-numpy/python-numpy_1.16.3.bb
@@ -0,0 +1,10 @@
+inherit setuptools
+require python-numpy.inc
+
+RDEPENDS_${PN}_class-target_append = " \
+    ${PYTHON_PN}-subprocess \
+"
+
+do_install_append(){
+        rm ${D}/${bindir}/f2py
+}
diff --git a/meta-arago-distro/recipes-devtools/python-numpy/python3-numpy_1.16.3.bb b/meta-arago-distro/recipes-devtools/python-numpy/python3-numpy_1.16.3.bb
new file mode 100644
index 0000000..d388e88
--- /dev/null
+++ b/meta-arago-distro/recipes-devtools/python-numpy/python3-numpy_1.16.3.bb
@@ -0,0 +1,3 @@
+inherit setuptools3
+require python-numpy.inc
+
-- 
2.7.4


