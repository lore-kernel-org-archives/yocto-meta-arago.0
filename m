Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF499C02182
	for <webhook@archiver.kernel.org>; Thu, 23 Jan 2025 15:56:31 +0000 (UTC)
Received: from fllvem-ot03.ext.ti.com (fllvem-ot03.ext.ti.com [198.47.19.245])
 by mx.groups.io with SMTP id smtpd.web10.13694.1737647783012184041
 for <meta-arago@lists.yoctoproject.org>;
 Thu, 23 Jan 2025 07:56:23 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=dHz7QK92;
 spf=pass (domain: ti.com, ip: 198.47.19.245, mailfrom: reatmon@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot03.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 50NFuJIE1200499
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Thu, 23 Jan 2025 09:56:19 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1737647779;
	bh=WU6qVf59Fjr7C7/9w44hnOIP1zcxpiznAw+MvL/ts1E=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=dHz7QK926Vq2TZ9ddr+TVEX75Rd7fkkXzof/kbrcATBhlfmz1IFfBNQqIIQ4zizTb
	 h1gQWtBwbQ73hzB4LWxFFV857ole1kcvWuSq1pEqZWs1O7MQO5WCfAGCejfqCvRDid
	 cynDvwr40y6s7mWsiY/3CIHskcxbhYqy7fDmPFs8=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 50NFuJWF069056
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 23 Jan 2025 09:56:19 -0600
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 23
 Jan 2025 09:56:19 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 23 Jan 2025 09:56:19 -0600
Received: from [10.250.37.153] ([10.250.37.153])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 50NFuJfj005876;
	Thu, 23 Jan 2025 09:56:19 -0600
Message-ID: <c4df7e71-46e3-44cd-a1c3-18445d49c3ef@ti.com>
Date: Thu, 23 Jan 2025 09:56:19 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [meta-arago][scarthgap/master][PATCH 4/6] meta-arago-extras:
 Backport abseil-cpp from meta-oe master
To: Andrew Davis <afd@ti.com>, Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>,
        Chirag Shilwant
	<c-shilwant@ti.com>,
        <meta-arago@lists.yoctoproject.org>
References: <20250117002520.627504-1-afd@ti.com>
 <20250117002520.627504-5-afd@ti.com> <20250122230200.GU21836@denix.org>
 <a02af7c0-85f1-4035-94be-897912e0e2ef@ti.com>
Content-Language: en-US
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <a02af7c0-85f1-4035-94be-897912e0e2ef@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot03.ext.ti.com id 50NFuJIE1200499
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Thu, 23 Jan 2025 15:56:31 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/15741



On 1/23/2025 9:49 AM, Andrew Davis wrote:
> On 1/22/25 5:02 PM, Denys Dmytriyenko wrote:
>> On Thu, Jan 16, 2025 at 06:25:18PM -0600, Andrew Davis via=20
>> lists.yoctoproject.org wrote:
>>> ONNX and ONNX Runtime depend on a very specific version of Abseil tha=
t
>>> is not the version included with meta-oe scarthgap. But it just so
>>> happens to be the version provided in current meta-oe master.
>>> Backport this version for our use in scarthgap.
>>>
>>> This patch is not needed for meta-arago master branch. If meta-oe
>>> master at some point moves to a newer incompatible version of
>>> Abseil we will deal with this dependency in a different way.
>>
>> Just a note here - there's an effort to improve meta-arago-* layers=20
>> quality
>> and eventually seek a Yocto Project Compatible status for them. Adding=
 a
>> version of a recipe that exists upstream is possible, but requires=20
>> some extra
>> attention, especially when it's a newer version and gets preferred by=20
>> BitBake
>> automatically. One way to do it is to lower its default preference wit=
h
>> DEFAULT_PREFERENCE =3D "-1" and then set a corresponding=20
>> PREFERRED_VERSION in
>> the distro conf...
>>
>=20
> Good info, thanks, if I need to make a change like this going forward=20
> I'll do
> it like that. (I'm assuming our scarthgap branch isn't going to be a=20
> candidate
> for this Yocto Compat status, and this patch is only for scarthgap so n=
o=20
> fix
> needed for this patch?)

The patch is labelled as being for master as well...  Can we not mix the=20
scarthgap/master patches in a single series unless they truly should be=20
applied to both.  It's really annoying to manually pick and choose which=20
patches to apply where.


> Andrew
>=20
>>
>>> Signed-off-by: Andrew Davis <afd@ti.com>
>>> ---
>>> =C2=A0 .../0001-absl-always-use-asm-sgidefs.h.patch=C2=A0 |=C2=A0 38 =
+++++++
>>> =C2=A0 ...e-maes-option-from-cross-compilation.patch |=C2=A0 38 +++++=
++
>>> =C2=A0 ...e-neon-option-from-cross-compilation.patch |=C2=A0 49 +++++=
++++
>>> =C2=A0 .../abseil-cpp/0004-abseil-ppc-fixes.patch=C2=A0=C2=A0=C2=A0 |=
 103 ++++++++++++++++++
>>> =C2=A0 ...-virtual-dtor-in-the-flags-are-neede.patch |=C2=A0 30 +++++
>>> =C2=A0 .../abseil-cpp/abseil-cpp_20240722.0.bb=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 54 +++++++++
>>> =C2=A0 6 files changed, 312 insertions(+)
>>> =C2=A0 create mode 100644=20
>>> meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0001-absl-al=
ways-use-asm-sgidefs.h.patch
>>> =C2=A0 create mode 100644=20
>>> meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0002-Remove-=
maes-option-from-cross-compilation.patch
>>> =C2=A0 create mode 100644=20
>>> meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0003-Remove-=
neon-option-from-cross-compilation.patch
>>> =C2=A0 create mode 100644=20
>>> meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0004-abseil-=
ppc-fixes.patch
>>> =C2=A0 create mode 100644=20
>>> meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0005-Don-t-m=
atch-Wnon-virtual-dtor-in-the-flags-are-neede.patch
>>> =C2=A0 create mode 100644=20
>>> meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp_20240722.0.b=
b
>>>
>>> diff --git=20
>>> a/meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0001-absl-=
always-use-asm-sgidefs.h.patch b/meta-arago-extras/recipes-devtools/absei=
l-cpp/abseil-cpp/0001-absl-always-use-asm-sgidefs.h.patch
>>> new file mode 100644
>>> index 00000000..6fecf256
>>> --- /dev/null
>>> +++=20
>>> b/meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0001-absl-=
always-use-asm-sgidefs.h.patch
>>> @@ -0,0 +1,38 @@
>>> +From 11faa06436fdeb0c9948080a11f9a99d3b5ba16c Mon Sep 17 00:00:00 20=
01
>>> +From: Khem Raj <raj.khem@gmail.com>
>>> +Date: Thu, 9 Apr 2020 13:06:27 -0700
>>> +Subject: [PATCH] absl: always use <asm/sgidefs.h>
>>> +
>>> +Fixes mips/musl build, since sgidefs.h is not present on all C=20
>>> libraries
>>> +but on linux asm/sgidefs.h is there and contains same definitions,=20
>>> using
>>> +that makes it portable.
>>> +
>>> +Upstream-Status: Pending
>>> +
>>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> +---
>>> + absl/base/internal/direct_mmap.h | 6 +-----
>>> + 1 file changed, 1 insertion(+), 5 deletions(-)
>>> +
>>> +diff --git a/absl/base/internal/direct_mmap.h=20
>>> b/absl/base/internal/direct_mmap.h
>>> +index 1beb2ee4..140b0697 100644
>>> +--- a/absl/base/internal/direct_mmap.h
>>> ++++ b/absl/base/internal/direct_mmap.h
>>> +@@ -41,13 +41,9 @@
>>> +
>>> + #ifdef __mips__
>>> + // Include definitions of the ABI currently in use.
>>> +-#if defined(__BIONIC__) || !defined(__GLIBC__)
>>> +-// Android doesn't have sgidefs.h, but does have asm/sgidefs.h,=20
>>> which has the
>>> ++// bionic/musl C libs don't have sgidefs.h, but do have=20
>>> asm/sgidefs.h, which has the
>>> + // definitions we need.
>>> + #include <asm/sgidefs.h>
>>> +-#else
>>> +-#include <sgidefs.h>
>>> +-#endif=C2=A0 // __BIONIC__ || !__GLIBC__
>>> + #endif=C2=A0 // __mips__
>>> +
>>> + // SYS_mmap and SYS_munmap are not defined in Android.
>>> +--
>>> +2.25.1
>>> +
>>> diff --git=20
>>> a/meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0002-Remov=
e-maes-option-from-cross-compilation.patch b/meta-arago-extras/recipes-de=
vtools/abseil-cpp/abseil-cpp/0002-Remove-maes-option-from-cross-compilati=
on.patch
>>> new file mode 100644
>>> index 00000000..d49e860f
>>> --- /dev/null
>>> +++=20
>>> b/meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0002-Remov=
e-maes-option-from-cross-compilation.patch
>>> @@ -0,0 +1,38 @@
>>> +From a573ccd57e713486e7d8e782d6b3b34fde01ff9e Mon Sep 17 00:00:00 20=
01
>>> +From: Sinan Kaya <sinan.kaya@microsoft.com>
>>> +Date: Mon, 3 Feb 2020 03:25:57 +0000
>>> +Subject: [PATCH] Remove maes option from cross-compilation
>>> +
>>> +Upstream-Status: Pending
>>> +---
>>> + absl/copts/GENERATED_AbseilCopts.cmake | 4 ----
>>> + absl/copts/GENERATED_copts.bzl=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 4 ----
>>> + 2 files changed, 8 deletions(-)
>>> +
>>> +diff --git a/absl/copts/GENERATED_AbseilCopts.cmake=20
>>> b/absl/copts/GENERATED_AbseilCopts.cmake
>>> +index da2282fe..5e0e8dfd 100644
>>> +--- a/absl/copts/GENERATED_AbseilCopts.cmake
>>> ++++ b/absl/copts/GENERATED_AbseilCopts.cmake
>>> +@@ -229,7 +229,3 @@ list(APPEND ABSL_RANDOM_HWAES_ARM64_FLAGS
>>> + list(APPEND ABSL_RANDOM_HWAES_MSVC_X64_FLAGS
>>> + )
>>> +
>>> +-list(APPEND ABSL_RANDOM_HWAES_X64_FLAGS
>>> +-=C2=A0=C2=A0=C2=A0 "-maes"
>>> +-=C2=A0=C2=A0=C2=A0 "-msse4.1"
>>> +-)
>>> +diff --git a/absl/copts/GENERATED_copts.bzl=20
>>> b/absl/copts/GENERATED_copts.bzl
>>> +index b9e0071e..0072008c 100644
>>> +--- a/absl/copts/GENERATED_copts.bzl
>>> ++++ b/absl/copts/GENERATED_copts.bzl
>>> +@@ -230,7 +230,3 @@ ABSL_RANDOM_HWAES_ARM64_FLAGS =3D [
>>> + ABSL_RANDOM_HWAES_MSVC_X64_FLAGS =3D [
>>> + ]
>>> +
>>> +-ABSL_RANDOM_HWAES_X64_FLAGS =3D [
>>> +-=C2=A0=C2=A0=C2=A0 "-maes",
>>> +-=C2=A0=C2=A0=C2=A0 "-msse4.1",
>>> +-]
>>> +--
>>> +2.25.1
>>> +
>>> diff --git=20
>>> a/meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0003-Remov=
e-neon-option-from-cross-compilation.patch b/meta-arago-extras/recipes-de=
vtools/abseil-cpp/abseil-cpp/0003-Remove-neon-option-from-cross-compilati=
on.patch
>>> new file mode 100644
>>> index 00000000..c82b9e1b
>>> --- /dev/null
>>> +++=20
>>> b/meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0003-Remov=
e-neon-option-from-cross-compilation.patch
>>> @@ -0,0 +1,49 @@
>>> +From 632632508daf8bb3a5800dac937ffc33c6d85973 Mon Sep 17 00:00:00 20=
01
>>> +From: Jonas Gorski <jonas.gorski@bisdn.de>
>>> +Date: Thu, 16 Jun 2022 11:46:31 +0000
>>> +Subject: [PATCH] Remove neon option from cross compilation
>>> +
>>> +Not every arm platform supports neon instructions, so do not enforce
>>> +them.
>>> +
>>> +Upstream-Status: Pending
>>> +
>>> +Signed-off-by: Jonas Gorski <jonas.gorski@bisdn.de>
>>> +---
>>> + absl/copts/GENERATED_AbseilCopts.cmake | 4 ----
>>> + absl/copts/GENERATED_copts.bzl=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 4 ----
>>> + 2 files changed, 8 deletions(-)
>>> +
>>> +diff --git a/absl/copts/GENERATED_AbseilCopts.cmake=20
>>> b/absl/copts/GENERATED_AbseilCopts.cmake
>>> +index 5e0e8dfd..57cfc4d3 100644
>>> +--- a/absl/copts/GENERATED_AbseilCopts.cmake
>>> ++++ b/absl/copts/GENERATED_AbseilCopts.cmake
>>> +@@ -218,10 +218,6 @@ list(APPEND ABSL_MSVC_TEST_FLAGS
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 "/DNOMINMAX"
>>> + )
>>> +
>>> +-list(APPEND ABSL_RANDOM_HWAES_ARM32_FLAGS
>>> +-=C2=A0=C2=A0=C2=A0 "-mfpu=3Dneon"
>>> +-)
>>> +-
>>> + list(APPEND ABSL_RANDOM_HWAES_ARM64_FLAGS
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 "-march=3Darmv8-a+crypto"
>>> + )
>>> +diff --git a/absl/copts/GENERATED_copts.bzl=20
>>> b/absl/copts/GENERATED_copts.bzl
>>> +index 0072008c..72840fda 100644
>>> +--- a/absl/copts/GENERATED_copts.bzl
>>> ++++ b/absl/copts/GENERATED_copts.bzl
>>> +@@ -219,10 +219,6 @@ ABSL_MSVC_TEST_FLAGS =3D [
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 "/DNOMINMAX",
>>> + ]
>>> +
>>> +-ABSL_RANDOM_HWAES_ARM32_FLAGS =3D [
>>> +-=C2=A0=C2=A0=C2=A0 "-mfpu=3Dneon",
>>> +-]
>>> +-
>>> + ABSL_RANDOM_HWAES_ARM64_FLAGS =3D [
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 "-march=3Darmv8-a+crypto",
>>> + ]
>>> +--
>>> +2.25.1
>>> +
>>> diff --git=20
>>> a/meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0004-absei=
l-ppc-fixes.patch b/meta-arago-extras/recipes-devtools/abseil-cpp/abseil-=
cpp/0004-abseil-ppc-fixes.patch
>>> new file mode 100644
>>> index 00000000..ba0cd669
>>> --- /dev/null
>>> +++=20
>>> b/meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0004-absei=
l-ppc-fixes.patch
>>> @@ -0,0 +1,103 @@
>>> +From f9607924225ca59fb6c60222e6424b84e6f70029 Mon Sep 17 00:00:00 20=
01
>>> +From: Khem Raj <raj.khem@gmail.com>
>>> +Date: Sat, 21 Sep 2024 20:53:06 +0800
>>> +Subject: [PATCH] abseil: ppc fixes
>>> +
>>> +An all-in-one patch that fixes several issues:
>>> +
>>> +1) UnscaledCycleClock not fully implemented for ppc*-musl (disabled=20
>>> on musl)
>>> +2) powerpc stacktrace implementation only works on glibc (disabled=20
>>> on musl)
>>> +3) powerpc stacktrace implementation has ppc64 assumptions (fixed)
>>> +4) examine_stack.cpp makes glibc assumptions on powerpc (fixed)
>>> +
>>> +Sourced from void linux
>>> +
>>> +Upstream-Status: Pending
>>> +
>>> +Signed-off-by: Khem Raj <raj.khem@gmail.com>
>>> +---
>>> + absl/base/internal/unscaledcycleclock.cc=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 4 ++--
>>> + absl/base/internal/unscaledcycleclock_config.h | 3 ++-
>>> + absl/debugging/internal/examine_stack.cc=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 8 +++++++-
>>> + absl/debugging/internal/stacktrace_config.h=C2=A0=C2=A0=C2=A0 | 2 +=
-
>>> + 4 files changed, 12 insertions(+), 5 deletions(-)
>>> +
>>> +diff --git a/absl/base/internal/unscaledcycleclock.cc=20
>>> b/absl/base/internal/unscaledcycleclock.cc
>>> +index a0bf3a65..103b4f6a 100644
>>> +--- a/absl/base/internal/unscaledcycleclock.cc
>>> ++++ b/absl/base/internal/unscaledcycleclock.cc
>>> +@@ -20,7 +20,7 @@
>>> + #include <intrin.h>
>>> + #endif
>>> +
>>> +-#if defined(__powerpc__) || defined(__ppc__)
>>> ++#if (defined(__powerpc__) || defined(__ppc__)) && defined(__GLIBC__=
)
>>> + #ifdef __GLIBC__
>>> + #include <sys/platform/ppc.h>
>>> + #elif defined(__FreeBSD__)
>>> +@@ -58,7 +58,7 @@ double UnscaledCycleClock::Frequency() {
>>> +=C2=A0=C2=A0 return base_internal::NominalCPUFrequency();
>>> + }
>>> +
>>> +-#elif defined(__powerpc__) || defined(__ppc__)
>>> ++#elif (defined(__powerpc__) || defined(__ppc__)) && defined(__GLIBC=
__)
>>> +
>>> + int64_t UnscaledCycleClock::Now() {
>>> + #ifdef __GLIBC__
>>> +diff --git a/absl/base/internal/unscaledcycleclock_config.h=20
>>> b/absl/base/internal/unscaledcycleclock_config.h
>>> +index 43a3dabe..196a8535 100644
>>> +--- a/absl/base/internal/unscaledcycleclock_config.h
>>> ++++ b/absl/base/internal/unscaledcycleclock_config.h
>>> +@@ -21,7 +21,8 @@
>>> +
>>> + // The following platforms have an implementation of a hardware=20
>>> counter.
>>> + #if defined(__i386__) || defined(__x86_64__) ||=20
>>> defined(__aarch64__) || \
>>> +-=C2=A0=C2=A0=C2=A0 defined(__powerpc__) || defined(__ppc__) || defi=
ned(_M_IX86)=20
>>> ||=C2=A0=C2=A0=C2=A0=C2=A0 \
>>> ++=C2=A0=C2=A0=C2=A0 ((defined(__powerpc__) || defined(__ppc__)) &&=20
>>> defined(__GLIBC__)) || \
>>> ++=C2=A0=C2=A0=C2=A0 defined(_M_IX86) ||=C2=A0=C2=A0=C2=A0=C2=A0 \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 (defined(_M_X64) && !defined(_M_ARM64EC))
>>> + #define ABSL_HAVE_UNSCALED_CYCLECLOCK_IMPLEMENTATION 1
>>> + #else
>>> +diff --git a/absl/debugging/internal/examine_stack.cc=20
>>> b/absl/debugging/internal/examine_stack.cc
>>> +index 3dd6ba1a..f923b055 100644
>>> +--- a/absl/debugging/internal/examine_stack.cc
>>> ++++ b/absl/debugging/internal/examine_stack.cc
>>> +@@ -36,6 +36,10 @@
>>> + #include <csignal>
>>> + #include <cstdio>
>>> +
>>> ++#if defined(__powerpc__)
>>> ++#include <asm/ptrace.h>
>>> ++#endif
>>> ++
>>> + #include "absl/base/attributes.h"
>>> + #include "absl/base/internal/raw_logging.h"
>>> + #include "absl/base/macros.h"
>>> +@@ -177,8 +181,10 @@ void* GetProgramCounter(void* const vuc) {
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 return reinterpret_cast<void*>(context->uc_=
mcontext.pc);
>>> + #elif defined(__powerpc64__)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 return reinterpret_cast<void*>(context->uc_=
mcontext.gp_regs[32]);
>>> +-#elif defined(__powerpc__)
>>> ++#elif defined(__powerpc__) && defined(__GLIBC__)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 return=20
>>> reinterpret_cast<void*>(context->uc_mcontext.uc_regs->gregs[32]);
>>> ++#elif defined(__powerpc__)
>>> ++=C2=A0=C2=A0=C2=A0 return reinterpret_cast<void*>((context->uc_regs=
)->gregs[32]);
>>> + #elif defined(__riscv)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0 return=20
>>> reinterpret_cast<void*>(context->uc_mcontext.__gregs[REG_PC]);
>>> + #elif defined(__s390__) && !defined(__s390x__)
>>> +diff --git a/absl/debugging/internal/stacktrace_config.h=20
>>> b/absl/debugging/internal/stacktrace_config.h
>>> +index 3929b1b7..23d5e504 100644
>>> +--- a/absl/debugging/internal/stacktrace_config.h
>>> ++++ b/absl/debugging/internal/stacktrace_config.h
>>> +@@ -60,7 +60,7 @@
>>> + #elif defined(__i386__) || defined(__x86_64__)
>>> + #define ABSL_STACKTRACE_INL_HEADER \
>>> +=C2=A0=C2=A0 "absl/debugging/internal/stacktrace_x86-inl.inc"
>>> +-#elif defined(__ppc__) || defined(__PPC__)
>>> ++#elif (defined(__ppc__) || defined(__PPC__)) && defined(__GLIBC__)
>>> + #define ABSL_STACKTRACE_INL_HEADER \
>>> +=C2=A0=C2=A0 "absl/debugging/internal/stacktrace_powerpc-inl.inc"
>>> + #elif defined(__aarch64__)
>>> +--
>>> +2.25.1
>>> +
>>> diff --git=20
>>> a/meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0005-Don-t=
-match-Wnon-virtual-dtor-in-the-flags-are-neede.patch b/meta-arago-extras=
/recipes-devtools/abseil-cpp/abseil-cpp/0005-Don-t-match-Wnon-virtual-dto=
r-in-the-flags-are-neede.patch
>>> new file mode 100644
>>> index 00000000..9a4fc0b4
>>> --- /dev/null
>>> +++=20
>>> b/meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp/0005-Don-t=
-match-Wnon-virtual-dtor-in-the-flags-are-neede.patch
>>> @@ -0,0 +1,30 @@
>>> +From 9cb5e5d15c142e5cc43a2c1db87c8e4e5b6d38a5 Mon Sep 17 00:00:00 20=
01
>>> +From: Derek Mauro <dmauro@google.com>
>>> +Date: Mon, 5 Aug 2024 07:35:05 -0700
>>> +Subject: [PATCH] Don't match -Wnon-virtual-dtor in the "flags are=20
>>> needed to
>>> + suppress warnings in headers". It should fall through to the "don't=
=20
>>> impose
>>> + our warnings on others" case. Do this by matching on "-Wno-*"=20
>>> instead of
>>> + "-Wno*".
>>> +
>>> +Fixes #1737
>>> +
>>> +PiperOrigin-RevId: 659548798
>>> +Change-Id: I49d7ba7ddcd7be30f946fca90ba9be467181e854
>>> +Upstream-Status: Backport=20
>>> [https://github.com/abseil/abseil-cpp/commit/9cb5e5d15c142e5cc43a2c1d=
b87c8e4e5b6d38a5]
>>> +---
>>> + CMake/AbseilHelpers.cmake | 2 +-
>>> + 1 file changed, 1 insertion(+), 1 deletion(-)
>>> +
>>> +diff --git a/CMake/AbseilHelpers.cmake b/CMake/AbseilHelpers.cmake
>>> +index b177e590..3c4c92fe 100644
>>> +--- a/CMake/AbseilHelpers.cmake
>>> ++++ b/CMake/AbseilHelpers.cmake
>>> +@@ -195,7 +195,7 @@ function(absl_cc_library)
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # specified platfor=
m. Filter both of them out before the=20
>>> successor
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # reaches the "^-m"=
 filter.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set(skip_next_cflag=
 ON)
>>> +-=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 elseif(${cflag} MATCHES "^(-Wno|/wd)=
")
>>> ++=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 elseif(${cflag} MATCHES "^(-Wno-|/wd=
)")
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 # These flags are n=
eeded to suppress warnings that might=20
>>> fire in our headers.
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set(PC_CFLAGS "${PC=
_CFLAGS} ${cflag}")
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 elseif(${cflag} MATCHES "^(-W|/=
w[1234eo])")
>>> diff --git=20
>>> a/meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp_20240722.0=
.bb b/meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp_20240722.0=
.bb
>>> new file mode 100644
>>> index 00000000..4bfc2100
>>> --- /dev/null
>>> +++=20
>>> b/meta-arago-extras/recipes-devtools/abseil-cpp/abseil-cpp_20240722.0=
.bb
>>> @@ -0,0 +1,54 @@
>>> +SUMMARY =3D "Abseil is a cpp library like STL"
>>> +DESCRIPTION =3D "Abseil provides pieces missing from the C++ standar=
d.=20
>>> Contains \
>>> +additional useful libraries like algorithm, container, debugging,=20
>>> hash, memory, \
>>> +meta, numeric, strings, synchronization, time, types and utility."
>>> +HOMEPAGE =3D "https://abseil.io/"
>>> +SECTION =3D "libs"
>>> +LICENSE =3D "Apache-2.0"
>>> +LIC_FILES_CHKSUM =3D=20
>>> "file://LICENSE;md5=3Ddf52c6edb7adc22e533b2bacc3bd3915"
>>> +
>>> +SRCREV =3D "4447c7562e3bc702ade25105912dce503f0c4010"
>>> +BRANCH =3D "lts_2024_07_22"
>>> +SRC_URI =3D=20
>>> "git://github.com/abseil/abseil-cpp;branch=3D${BRANCH};protocol=3Dhtt=
ps \
>>> +          =20
>>> file://0001-absl-always-use-asm-sgidefs.h.patch=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 \
>>> +          =20
>>> file://0002-Remove-maes-option-from-cross-compilation.patch \
>>> +          =20
>>> file://0003-Remove-neon-option-from-cross-compilation.patch \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file://=
0004-abseil-ppc-fixes.patch \
>>> +          =20
>>> file://0005-Don-t-match-Wnon-virtual-dtor-in-the-flags-are-neede.patc=
h \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "
>>> +
>>> +S =3D "${WORKDIR}/git"
>>> +
>>> +inherit cmake
>>> +
>>> +EXTRA_OECMAKE =3D "-DBUILD_SHARED_LIBS=3DON \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DBUILD_TESTING=3DOFF=C2=A0=C2=A0=C2=A0 \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0 -DABSL_ENABLE_INSTALL=3DON \
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0 "
>>> +
>>> +SYSROOT_DIRS:append:class-nativesdk:mingw32 =3D " ${bindir}"
>>> +
>>> +PACKAGES_DYNAMIC +=3D "^libabsl-*"
>>> +PACKAGES_DYNAMIC:class-native =3D ""
>>> +
>>> +PACKAGESPLITFUNCS =3D+ "split_dynamic_packages"
>>> +
>>> +python split_dynamic_packages() {
>>> +=C2=A0=C2=A0=C2=A0 libdir =3D d.getVar('libdir')
>>> +
>>> +=C2=A0=C2=A0=C2=A0 libpackages =3D do_split_packages(
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 root=3Dlibdir,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 file_regex=3Dr'^libabsl_(=
.*)\.so\..*$',
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 output_pattern=3D'libabsl=
-%s',
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 description=3D"abseil sha=
red library %s",
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 prepend=3DTrue,
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 extra_depends=3D'',
>>> +=C2=A0=C2=A0=C2=A0 )
>>> +=C2=A0=C2=A0=C2=A0 if libpackages:
>>> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 d.appendVar('RDEPENDS:' +=
 d.getVar('PN'), ' ' + '=20
>>> '.join(libpackages))
>>> +}
>>> +
>>> +ALLOW_EMPTY:${PN} =3D "1"
>>> +
>>> +BBCLASSEXTEND =3D "native nativesdk"
>>> --=20
>>> 2.39.2

--=20
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS

