Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3EE4C0218B
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 15:49:31 +0000 (UTC)
Received: from lelvem-ot01.ext.ti.com (lelvem-ot01.ext.ti.com [198.47.23.234])
 by mx.groups.io with SMTP id smtpd.web11.13933.1737647369943858964
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 23 Jan 2025 07:49:30 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=SqLwX7X2;
 spf=pass (domain: ti.com, ip: 198.47.23.234, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50NFnPWq1224025
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Thu, 23 Jan 2025 09:49:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737647365;
	bh=ULYrMsfpwMqon3fmgJx+P4RTJS++BRePrIe8EiRFF8g=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=SqLwX7X2t1edLj7Xpa7cQ/qF4mB4MosJ84jWbm9bBoGSC4r+a/Nq6jo2WC5kJQOkl
	 RtLjB58jGjvdGkUrBRmZiqtBnc9DnRRZDEKv46hjpa3IqJ59RNZmr9SWd8olHxDBhK
	 abgq+ZmqJOBGUwLpLKbuWLMLWF6ifBvAJRF451/Y=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50NFnPVY087454;
	Thu, 23 Jan 2025 09:49:25 -0600
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE108.ent.ti.com
 (157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 23
 Jan 2025 09:49:24 -0600
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 23 Jan 2025 09:49:24 -0600
Received: from [10.249.42.149] ([10.249.42.149])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50NFnOFu109905;
	Thu, 23 Jan 2025 09:49:24 -0600
Message-ID: <a02af7c0-85f1-4035-94be-897912e0e2ef@ti.com>
Date: Thu, 23 Jan 2025 09:49:24 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap/master][PATCH 4/6] meta-arago-extras:
 Backport abseil-cpp from meta-oe master
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        Chirag Shilwant <c-shilwant@ti.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20250117002520.627504-1-afd@ti.com>
 <20250117002520.627504-5-afd@ti.com> <20250122230200.GU21836@denix.org>
Content-Language: en-US
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20250122230200.GU21836@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 23 Jan 2025 15:49:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15740

On 1/22/25 5:02 PM, Denys Dmytriyenko wrote:
> On Thu, Jan 16, 2025 at 06:25:18PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
>> ONNX and ONNX Runtime depend on a very specific version of Abseil that
>> is not the version included with meta-oe scarthgap. But it just so
>> happens to be the version provided in current meta-oe master.
>> Backport this version for our use in scarthgap.
>>
>> This patch is not needed for meta-arago master branch. If meta-oe
>> master at some point moves to a newer incompatible version of
>> Abseil we will deal with this dependency in a different way.
> 
> Just a note here - there's an effort to improve meta-arago-* layers quality
> and eventually seek a Yocto Project Compatible status for them. Adding a
> version of a recipe that exists upstream is possible, but requires some extra
> attention, especially when it's a newer version and gets preferred by BitBake
> automatically. One way to do it is to lower its default preference with
> DEFAULT_PREFERENCE = "-1" and then set a corresponding PREFERRED_VERSION in
> the distro conf...
> 

Good info, thanks, if I need to make a change like this going forward I'll do
it like that. (I'm assuming our scarthgap branch isn't going to be a candidate
for this Yocto Compat status, and this patch is only for scarthgap so no fix
needed for this patch?)

Andrew

> 
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   .../0001-absl-always-use-asm-sgidefs.h.patch  |  38 +++++++
>>   ...e-maes-option-from-cross-compilation.patch |  38 +++++++
>>   ...e-neon-option-from-cross-compilation.patch |  49 +++++++++
>>   .../abseil-cpp/0004-abseil-ppc-fixes.patch    | 103 ++++++++++++++++++
>>   ...-virtual-dtor-in-the-flags-are-neede.patch |  30 +++++
>>   .../abseil-cpp/abseil-cpp_20240722.0.bb       |  54 +++++++++
>>   6 files changed, 312 insertions(+)
>>   create mode 100644 meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0001-absl-always-use-asm-sgidefs.h.patch
>>   create mode 100644 meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0002-Remove-maes-option-from-cross-compilation.patch
>>   create mode 100644 meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0003-Remove-neon-option-from-cross-compilation.patch
>>   create mode 100644 meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0004-abseil-ppc-fixes.patch
>>   create mode 100644 meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0005-Don-t-match-Wnon-virtual-dtor-in-the-flags-are-neede.patch
>>   create mode 100644 meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp_20240722.0.bb
>>
>> diff --git a/meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0001-absl-always-use-asm-sgidefs.h.patch b/meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0001-absl-always-use-asm-sgidefs.h.patch
>> new file mode 100644
>> index 00000000..6fecf256
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0001-absl-always-use-asm-sgidefs.h.patch
>> @@ -0,0 +1,38 @@
>> +From 11faa06436fdeb0c9948080a11f9a99d3b5ba16c Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Thu, 9 Apr 2020 13:06:27 -0700
>> +Subject: [PATCH] absl: always use <asm/sgidefs.h>
>> +
>> +Fixes mips/musl build, since sgidefs.h is not present on all C libraries
>> +but on linux asm/sgidefs.h is there and contains same definitions, using
>> +that makes it portable.
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + absl/base/internal/direct_mmap.h | 6 +-----
>> + 1 file changed, 1 insertion(+), 5 deletions(-)
>> +
>> +diff --git a/absl/base/internal/direct_mmap.h b/absl/base/internal/direct_mmap.h
>> +index 1beb2ee4..140b0697 100644
>> +--- a/absl/base/internal/direct_mmap.h
>> ++++ b/absl/base/internal/direct_mmap.h
>> +@@ -41,13 +41,9 @@
>> +
>> + #ifdef __mips__
>> + // Include definitions of the ABI currently in use.
>> +-#if defined(__BIONIC__) || !defined(__GLIBC__)
>> +-// Android doesn't have sgidefs.h, but does have asm/sgidefs.h, which has the
>> ++// bionic/musl C libs don't have sgidefs.h, but do have asm/sgidefs.h, which has the
>> + // definitions we need.
>> + #include <asm/sgidefs.h>
>> +-#else
>> +-#include <sgidefs.h>
>> +-#endif  // __BIONIC__ || !__GLIBC__
>> + #endif  // __mips__
>> +
>> + // SYS_mmap and SYS_munmap are not defined in Android.
>> +--
>> +2.25.1
>> +
>> diff --git a/meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0002-Remove-maes-option-from-cross-compilation.patch b/meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0002-Remove-maes-option-from-cross-compilation.patch
>> new file mode 100644
>> index 00000000..d49e860f
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0002-Remove-maes-option-from-cross-compilation.patch
>> @@ -0,0 +1,38 @@
>> +From a573ccd57e713486e7d8e782d6b3b34fde01ff9e Mon Sep 17 00:00:00 2001
>> +From: Sinan Kaya <sinan.kaya@microsoft.com>
>> +Date: Mon, 3 Feb 2020 03:25:57 +0000
>> +Subject: [PATCH] Remove maes option from cross-compilation
>> +
>> +Upstream-Status: Pending
>> +---
>> + absl/copts/GENERATED_AbseilCopts.cmake | 4 ----
>> + absl/copts/GENERATED_copts.bzl         | 4 ----
>> + 2 files changed, 8 deletions(-)
>> +
>> +diff --git a/absl/copts/GENERATED_AbseilCopts.cmake b/absl/copts/GENERATED_AbseilCopts.cmake
>> +index da2282fe..5e0e8dfd 100644
>> +--- a/absl/copts/GENERATED_AbseilCopts.cmake
>> ++++ b/absl/copts/GENERATED_AbseilCopts.cmake
>> +@@ -229,7 +229,3 @@ list(APPEND ABSL_RANDOM_HWAES_ARM64_FLAGS
>> + list(APPEND ABSL_RANDOM_HWAES_MSVC_X64_FLAGS
>> + )
>> +
>> +-list(APPEND ABSL_RANDOM_HWAES_X64_FLAGS
>> +-    "-maes"
>> +-    "-msse4.1"
>> +-)
>> +diff --git a/absl/copts/GENERATED_copts.bzl b/absl/copts/GENERATED_copts.bzl
>> +index b9e0071e..0072008c 100644
>> +--- a/absl/copts/GENERATED_copts.bzl
>> ++++ b/absl/copts/GENERATED_copts.bzl
>> +@@ -230,7 +230,3 @@ ABSL_RANDOM_HWAES_ARM64_FLAGS = [
>> + ABSL_RANDOM_HWAES_MSVC_X64_FLAGS = [
>> + ]
>> +
>> +-ABSL_RANDOM_HWAES_X64_FLAGS = [
>> +-    "-maes",
>> +-    "-msse4.1",
>> +-]
>> +--
>> +2.25.1
>> +
>> diff --git a/meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0003-Remove-neon-option-from-cross-compilation.patch b/meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0003-Remove-neon-option-from-cross-compilation.patch
>> new file mode 100644
>> index 00000000..c82b9e1b
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0003-Remove-neon-option-from-cross-compilation.patch
>> @@ -0,0 +1,49 @@
>> +From 632632508daf8bb3a5800dac937ffc33c6d85973 Mon Sep 17 00:00:00 2001
>> +From: Jonas Gorski <jonas.gorski@bisdn.de>
>> +Date: Thu, 16 Jun 2022 11:46:31 +0000
>> +Subject: [PATCH] Remove neon option from cross compilation
>> +
>> +Not every arm platform supports neon instructions, so do not enforce
>> +them.
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
>> +---
>> + absl/copts/GENERATED_AbseilCopts.cmake | 4 ----
>> + absl/copts/GENERATED_copts.bzl         | 4 ----
>> + 2 files changed, 8 deletions(-)
>> +
>> +diff --git a/absl/copts/GENERATED_AbseilCopts.cmake b/absl/copts/GENERATED_AbseilCopts.cmake
>> +index 5e0e8dfd..57cfc4d3 100644
>> +--- a/absl/copts/GENERATED_AbseilCopts.cmake
>> ++++ b/absl/copts/GENERATED_AbseilCopts.cmake
>> +@@ -218,10 +218,6 @@ list(APPEND ABSL_MSVC_TEST_FLAGS
>> +     "/DNOMINMAX"
>> + )
>> +
>> +-list(APPEND ABSL_RANDOM_HWAES_ARM32_FLAGS
>> +-    "-mfpu=neon"
>> +-)
>> +-
>> + list(APPEND ABSL_RANDOM_HWAES_ARM64_FLAGS
>> +     "-march=armv8-a+crypto"
>> + )
>> +diff --git a/absl/copts/GENERATED_copts.bzl b/absl/copts/GENERATED_copts.bzl
>> +index 0072008c..72840fda 100644
>> +--- a/absl/copts/GENERATED_copts.bzl
>> ++++ b/absl/copts/GENERATED_copts.bzl
>> +@@ -219,10 +219,6 @@ ABSL_MSVC_TEST_FLAGS = [
>> +     "/DNOMINMAX",
>> + ]
>> +
>> +-ABSL_RANDOM_HWAES_ARM32_FLAGS = [
>> +-    "-mfpu=neon",
>> +-]
>> +-
>> + ABSL_RANDOM_HWAES_ARM64_FLAGS = [
>> +     "-march=armv8-a+crypto",
>> + ]
>> +--
>> +2.25.1
>> +
>> diff --git a/meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0004-abseil-ppc-fixes.patch b/meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0004-abseil-ppc-fixes.patch
>> new file mode 100644
>> index 00000000..ba0cd669
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0004-abseil-ppc-fixes.patch
>> @@ -0,0 +1,103 @@
>> +From f9607924225ca59fb6c60222e6424b84e6f70029 Mon Sep 17 00:00:00 2001
>> +From: Khem Raj <raj.khem@gmail.com>
>> +Date: Sat, 21 Sep 2024 20:53:06 +0800
>> +Subject: [PATCH] abseil: ppc fixes
>> +
>> +An all-in-one patch that fixes several issues:
>> +
>> +1) UnscaledCycleClock not fully implemented for ppc*-musl (disabled on musl)
>> +2) powerpc stacktrace implementation only works on glibc (disabled on musl)
>> +3) powerpc stacktrace implementation has ppc64 assumptions (fixed)
>> +4) examine_stack.cpp makes glibc assumptions on powerpc (fixed)
>> +
>> +Sourced from void linux
>> +
>> +Upstream-Status: Pending
>> +
>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>> +---
>> + absl/base/internal/unscaledcycleclock.cc       | 4 ++--
>> + absl/base/internal/unscaledcycleclock_config.h | 3 ++-
>> + absl/debugging/internal/examine_stack.cc       | 8 +++++++-
>> + absl/debugging/internal/stacktrace_config.h    | 2 +-
>> + 4 files changed, 12 insertions(+), 5 deletions(-)
>> +
>> +diff --git a/absl/base/internal/unscaledcycleclock.cc b/absl/base/internal/unscaledcycleclock.cc
>> +index a0bf3a65..103b4f6a 100644
>> +--- a/absl/base/internal/unscaledcycleclock.cc
>> ++++ b/absl/base/internal/unscaledcycleclock.cc
>> +@@ -20,7 +20,7 @@
>> + #include <intrin.h>
>> + #endif
>> +
>> +-#if defined(__powerpc__) || defined(__ppc__)
>> ++#if (defined(__powerpc__) || defined(__ppc__)) && defined(__GLIBC__)
>> + #ifdef __GLIBC__
>> + #include <sys/platform/ppc.h>
>> + #elif defined(__FreeBSD__)
>> +@@ -58,7 +58,7 @@ double UnscaledCycleClock::Frequency() {
>> +   return base_internal::NominalCPUFrequency();
>> + }
>> +
>> +-#elif defined(__powerpc__) || defined(__ppc__)
>> ++#elif (defined(__powerpc__) || defined(__ppc__)) && defined(__GLIBC__)
>> +
>> + int64_t UnscaledCycleClock::Now() {
>> + #ifdef __GLIBC__
>> +diff --git a/absl/base/internal/unscaledcycleclock_config.h b/absl/base/internal/unscaledcycleclock_config.h
>> +index 43a3dabe..196a8535 100644
>> +--- a/absl/base/internal/unscaledcycleclock_config.h
>> ++++ b/absl/base/internal/unscaledcycleclock_config.h
>> +@@ -21,7 +21,8 @@
>> +
>> + // The following platforms have an implementation of a hardware counter.
>> + #if defined(__i386__) || defined(__x86_64__) || defined(__aarch64__) || \
>> +-    defined(__powerpc__) || defined(__ppc__) || defined(_M_IX86) ||     \
>> ++    ((defined(__powerpc__) || defined(__ppc__)) && defined(__GLIBC__)) || \
>> ++    defined(_M_IX86) ||     \
>> +     (defined(_M_X64) && !defined(_M_ARM64EC))
>> + #define ABSL_HAVE_UNSCALED_CYCLECLOCK_IMPLEMENTATION 1
>> + #else
>> +diff --git a/absl/debugging/internal/examine_stack.cc b/absl/debugging/internal/examine_stack.cc
>> +index 3dd6ba1a..f923b055 100644
>> +--- a/absl/debugging/internal/examine_stack.cc
>> ++++ b/absl/debugging/internal/examine_stack.cc
>> +@@ -36,6 +36,10 @@
>> + #include <csignal>
>> + #include <cstdio>
>> +
>> ++#if defined(__powerpc__)
>> ++#include <asm/ptrace.h>
>> ++#endif
>> ++
>> + #include "absl/base/attributes.h"
>> + #include "absl/base/internal/raw_logging.h"
>> + #include "absl/base/macros.h"
>> +@@ -177,8 +181,10 @@ void* GetProgramCounter(void* const vuc) {
>> +     return reinterpret_cast<void*>(context->uc_mcontext.pc);
>> + #elif defined(__powerpc64__)
>> +     return reinterpret_cast<void*>(context->uc_mcontext.gp_regs[32]);
>> +-#elif defined(__powerpc__)
>> ++#elif defined(__powerpc__) && defined(__GLIBC__)
>> +     return reinterpret_cast<void*>(context->uc_mcontext.uc_regs->gregs[32]);
>> ++#elif defined(__powerpc__)
>> ++    return reinterpret_cast<void*>((context->uc_regs)->gregs[32]);
>> + #elif defined(__riscv)
>> +     return reinterpret_cast<void*>(context->uc_mcontext.__gregs[REG_PC]);
>> + #elif defined(__s390__) && !defined(__s390x__)
>> +diff --git a/absl/debugging/internal/stacktrace_config.h b/absl/debugging/internal/stacktrace_config.h
>> +index 3929b1b7..23d5e504 100644
>> +--- a/absl/debugging/internal/stacktrace_config.h
>> ++++ b/absl/debugging/internal/stacktrace_config.h
>> +@@ -60,7 +60,7 @@
>> + #elif defined(__i386__) || defined(__x86_64__)
>> + #define ABSL_STACKTRACE_INL_HEADER \
>> +   "absl/debugging/internal/stacktrace_x86-inl.inc"
>> +-#elif defined(__ppc__) || defined(__PPC__)
>> ++#elif (defined(__ppc__) || defined(__PPC__)) && defined(__GLIBC__)
>> + #define ABSL_STACKTRACE_INL_HEADER \
>> +   "absl/debugging/internal/stacktrace_powerpc-inl.inc"
>> + #elif defined(__aarch64__)
>> +--
>> +2.25.1
>> +
>> diff --git a/meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0005-Don-t-match-Wnon-virtual-dtor-in-the-flags-are-neede.patch b/meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0005-Don-t-match-Wnon-virtual-dtor-in-the-flags-are-neede.patch
>> new file mode 100644
>> index 00000000..9a4fc0b4
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0005-Don-t-match-Wnon-virtual-dtor-in-the-flags-are-neede.patch
>> @@ -0,0 +1,30 @@
>> +From 9cb5e5d15c142e5cc43a2c1db87c8e4e5b6d38a5 Mon Sep 17 00:00:00 2001
>> +From: Derek Mauro <dmauro@google.com>
>> +Date: Mon, 5 Aug 2024 07:35:05 -0700
>> +Subject: [PATCH] Don't match -Wnon-virtual-dtor in the "flags are needed to
>> + suppress warnings in headers". It should fall through to the "don't impose
>> + our warnings on others" case. Do this by matching on "-Wno-*" instead of
>> + "-Wno*".
>> +
>> +Fixes #1737
>> +
>> +PiperOrigin-RevId: 659548798
>> +Change-Id: I49d7ba7ddcd7be30f946fca90ba9be467181e854
>> +Upstream-Status: Backport [https://github.com/abseil/abseil-cpp/commit/9cb5e5d15c142e5cc43a2c1db87c8e4e5b6d38a5]
>> +---
>> + CMake/AbseilHelpers.cmake | 2 +-
>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>> +
>> +diff --git a/CMake/AbseilHelpers.cmake b/CMake/AbseilHelpers.cmake
>> +index b177e590..3c4c92fe 100644
>> +--- a/CMake/AbseilHelpers.cmake
>> ++++ b/CMake/AbseilHelpers.cmake
>> +@@ -195,7 +195,7 @@ function(absl_cc_library)
>> +         # specified platform. Filter both of them out before the successor
>> +         # reaches the "^-m" filter.
>> +         set(skip_next_cflag ON)
>> +-      elseif(${cflag} MATCHES "^(-Wno|/wd)")
>> ++      elseif(${cflag} MATCHES "^(-Wno-|/wd)")
>> +         # These flags are needed to suppress warnings that might fire in our headers.
>> +         set(PC_CFLAGS "${PC_CFLAGS} ${cflag}")
>> +       elseif(${cflag} MATCHES "^(-W|/w[1234eo])")
>> diff --git a/meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp_20240722.0.bb b/meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp_20240722.0.bb
>> new file mode 100644
>> index 00000000..4bfc2100
>> --- /dev/null
>> +++ b/meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp_20240722.0.bb
>> @@ -0,0 +1,54 @@
>> +SUMMARY = "Abseil is a cpp library like STL"
>> +DESCRIPTION = "Abseil provides pieces missing from the C++ standard. Contains \
>> +additional useful libraries like algorithm, container, debugging, hash, memory, \
>> +meta, numeric, strings, synchronization, time, types and utility."
>> +HOMEPAGE = "https://abseil.io/"
>> +SECTION = "libs"
>> +LICENSE = "Apache-2.0"
>> +LIC_FILES_CHKSUM = "file://LICENSE;md5=df52c6edb7adc22e533b2bacc3bd3915"
>> +
>> +SRCREV = "4447c7562e3bc702ade25105912dce503f0c4010"
>> +BRANCH = "lts_2024_07_22"
>> +SRC_URI = "git://github.com/abseil/abseil-cpp;branch=${BRANCH};protocol=https \
>> +           file://0001-absl-always-use-asm-sgidefs.h.patch             \
>> +           file://0002-Remove-maes-option-from-cross-compilation.patch \
>> +           file://0003-Remove-neon-option-from-cross-compilation.patch \
>> +           file://0004-abseil-ppc-fixes.patch \
>> +           file://0005-Don-t-match-Wnon-virtual-dtor-in-the-flags-are-neede.patch \
>> +          "
>> +
>> +S = "${WORKDIR}/git"
>> +
>> +inherit cmake
>> +
>> +EXTRA_OECMAKE = "-DBUILD_SHARED_LIBS=ON \
>> +                 -DBUILD_TESTING=OFF    \
>> +                 -DABSL_ENABLE_INSTALL=ON \
>> +                "
>> +
>> +SYSROOT_DIRS:append:class-nativesdk:mingw32 = " ${bindir}"
>> +
>> +PACKAGES_DYNAMIC += "^libabsl-*"
>> +PACKAGES_DYNAMIC:class-native = ""
>> +
>> +PACKAGESPLITFUNCS =+ "split_dynamic_packages"
>> +
>> +python split_dynamic_packages() {
>> +    libdir = d.getVar('libdir')
>> +
>> +    libpackages = do_split_packages(
>> +        d,
>> +        root=libdir,
>> +        file_regex=r'^libabsl_(.*)\.so\..*$',
>> +        output_pattern='libabsl-%s',
>> +        description="abseil shared library %s",
>> +        prepend=True,
>> +        extra_depends='',
>> +    )
>> +    if libpackages:
>> +        d.appendVar('RDEPENDS:' + d.getVar('PN'), ' ' + ' '.join(libpackages))
>> +}
>> +
>> +ALLOW_EMPTY:${PN} = "1"
>> +
>> +BBCLASSEXTEND = "native nativesdk"
>> -- 
>> 2.39.2

