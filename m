Return-Path: <b.hutchman@gmail.com>
Received: from mail-oa0-f54.google.com (mail-oa0-f54.google.com
	[209.85.219.54])
	by arago-project.org (Postfix) with ESMTPS id 122AD52A2D
	for <meta-arago@arago-project.org>;
	Fri, 11 Jul 2014 20:34:11 +0000 (UTC)
Received: by mail-oa0-f54.google.com with SMTP id n16so1806477oag.27
	for <meta-arago@arago-project.org>;
	Fri, 11 Jul 2014 13:34:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:date:message-id:subject:from:to:content-type;
	bh=r+tGAZwSq+aCf3cuW2kmsWFr/f7+T2hA+kj71ILYD6Y=;
	b=zD8H276I1khwVocRNycxrK68ZnvBJW1FblbeUyYv6lSusX9XQLciO8S7/W9ZLhVyWd
	Id2W5VWDWdi9ZmgeNB4PO0QaNt78Ly8NT4BW3Koauc95VUBXY+lstZo3Hf6seanQB65y
	YJZUYybocu2/YFp8PbmguXpvYniRpkPmYCA38qEx2fbKzTvedU1+zftLSUBLKbIsdawJ
	EvPEaDKVtb9v+6ajR5qXMZlrwO28rIeJBN1p0mVIyqmgtUixng/M/vpWlkOOBHV4lGZ+
	G8rCkotQ6QtZIX1gG0xK2FnBp0W/z3ITtIl2smyp8fL96GlZkh6pnEvvt6w91UT41uRA
	+gXQ==
MIME-Version: 1.0
X-Received: by 10.182.142.69 with SMTP id ru5mr1887631obb.6.1405110850765;
	Fri, 11 Jul 2014 13:34:10 -0700 (PDT)
Received: by 10.60.145.205 with HTTP; Fri, 11 Jul 2014 13:34:10 -0700 (PDT)
Date: Fri, 11 Jul 2014 16:34:10 -0400
Message-ID: <CAFZh4h8Z2Hn-e1gA+EZ8UunYsSadTAjii+NDjD27ay_kR_v_NA@mail.gmail.com>
From: Brian Hutchinson <b.hutchman@gmail.com>
To: meta-arago@arago-project.org
Subject: New Arago - am180x-evm core-image-minimal build is getting MD5 LICENSE errors in daisy
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
X-List-Received-Date: Fri, 11 Jul 2014 20:34:12 -0000
Content-Type: text/plain; charset=ISO-8859-1

Hi,

I haven't attempted this for a while so maybe I've missed something
but I'm trying to build core-image-minimal for am180x-evm.

Did a fresh checkout of
git://arago-project.org/git/projects/oe-layersetup.git tisdk
ran arago-daisy-config.txt, setup my local.conf with all the stuff I
wanted etc., and am using arago-2011.09-armv5te-linux-gnueabi
toolchain.

I've not tried to do too many OE Core type builds with an external
toolchain so I'm still trying to figure out the special situations
that come up using bitbake with external toolchains ... but I'm seeing
things like:

hutch@neo:~/arago_7_11_2014_am1808/tisdk/build$ bitbake core-image-minimal
Loading cache: 100%
|#############################################################################################################################################################################################################################|
ETA:  00:00:00
Loaded 2123 entries from dependency cache.
WARNING: Unable to get checksum for ltp-ddt-legacy SRC_URI entry
0001-wdt_test_suite-Make-sure-to-include-generated-header.patch: file
could not be found
                                    | ETA:  --:--:--
WARNING: Unable to get checksum for ltp-ddt-legacy SRC_URI entry
0001-KERNEL_INC-in-modern-kernel-should-point-at-toplevel.patch: file
could not be found
Parsing recipes: 100%
|###########################################################################################################################################################################################################################|
Time: 00:00:01
Parsing of 1693 .bb files complete (1690 cached, 3 parsed). 2125
targets, 186 skipped, 0 masked, 0 errors.
WARNING: No recipes available for:
  /home/hutch/arago_7_11_2014_am1808/tisdk/sources/meta-arago/meta-arago-distro/recipes-qt/qt5/qtwebkit_5.2.0.bbappend
  /home/hutch/arago_7_11_2014_am1808/tisdk/sources/meta-arago/meta-arago-distro/recipes-qt/qt5/qtbase_5.2.0.bbappend
  /home/hutch/arago_7_11_2014_am1808/tisdk/sources/meta-arago/meta-arago-distro/recipes-connectivity/openssl/openssl_1.0.1e.bbappend
NOTE: Resolving any missing task queue dependencies
NOTE: preferred version 4.5% of gcc-crosssdk not available (for item
virtual/i686-arago-linux-gcc-crosssdk)
NOTE: versions of gcc-crosssdk available: 4.6.3+svnr184847 4.8.2 linaro-4.8
NOTE: preferred version 4.5% of nativesdk-gcc-runtime not available
(for item virtual/nativesdk-i686-arago-linux-compilerlibs)
NOTE: versions of nativesdk-gcc-runtime available: 4.6.3+svnr184847
4.8.2 linaro-4.8
NOTE: preferred version 4.5% of gcc-crosssdk not available (for item
virtual/i686-arago-linux-g++-crosssdk)
NOTE: versions of gcc-crosssdk available: 4.6.3+svnr184847 4.8.2 linaro-4.8
NOTE: preferred version 4.5% of nativesdk-libgcc not available (for
item nativesdk-libgcc)
NOTE: versions of nativesdk-libgcc available: 4.6.3+svnr184847 4.8.2 linaro-4.8
NOTE: preferred version 4.5% of gcc-crosssdk-initial not available
(for item virtual/i686-arago-linux-gcc-initial-crosssdk)
NOTE: versions of gcc-crosssdk-initial available: 4.6.3+svnr184847
4.8.2 linaro-4.8
NOTE: preferred version 3.10 of nativesdk-linux-libc-headers not
available (for item nativesdk-linux-libc-headers)
NOTE: versions of nativesdk-linux-libc-headers available: 3.14
NOTE: preferred version 4.5% of nativesdk-libgcc not available (for
item nativesdk-libgcc)
NOTE: versions of nativesdk-libgcc available: 4.6.3+svnr184847 4.8.2 linaro-4.8
NOTE: preferred version 3.10 of nativesdk-linux-libc-headers not
available (for item nativesdk-linux-libc-headers-dev)
NOTE: versions of nativesdk-linux-libc-headers available: 3.14

Build Configuration:
BB_VERSION        = "1.22.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Debian-7.4"
TARGET_SYS        = "arm-oe-linux-gnueabi"
MACHINE           = "am180x-evm"
DISTRO            = "arago"
DISTRO_VERSION    = "2014.06"
TUNE_FEATURES     = "armv5 thumb dsp"
TARGET_FPU        = "soft"
meta-arago-distro
meta-arago-extras = "master:e159553bf9ffb8ef23e6f630904db0b3f7d58e6c"
meta-qt5          = "daisy:0137274b13a568718e441f8f1c611a653db9f2f7"
toolchain-layer
meta-networking
meta-ruby
meta-oe           = "daisy:ee24939c4c70b63a9fb7e93a58889a3231d3d367"
meta-ti           = "daisy:c58a5d88a21613c9e4b031df9aa1e19392547f4d"
meta-linaro-toolchain = "daisy:8a0601723c06fdb75e62aa0f0cf15fc9d7d90167"
meta              = "daisy:348b90a8a9b32e5e4a10960194a2f622cb07a0c6"

NOTE: Preparing runqueue
NOTE: Executing SetScene Tasks
NOTE: Executing RunQueue Tasks
ERROR: external-arago-toolchain: md5 data is not matching for
file:///home/hutch/arago_7_11_2014_am1808/tisdk/sources/oe-core/LICENSE;md5=3f40d7994397109285ec7b81fdeb3b58
ERROR: external-arago-toolchain: The new md5 checksum is
4d92cd373abda3937c2bc47fbc49d690
ERROR: external-arago-toolchain: Check if the license information has
changed in /home/hutch/arago_7_11_2014_am1808/tisdk/sources/oe-core/LICENSE
to verify that the LICENSE value "LGPLv2.1+" remains valid
ERROR: Licensing Error: LIC_FILES_CHKSUM does not match, please fix
ERROR: Function failed: do_qa_configure
ERROR: Logfile of failure stored in:
/home/hutch/arago_7_11_2014_am1808/tisdk/build/arago-tmp-external-arago-toolchain/work/armv5te-oe-linux-gnueabi/external-arago-toolchain/1.0-r4/temp/log.do_configure.20042
ERROR: Task 42 (/home/hutch/arago_7_11_2014_am1808/tisdk/sources/meta-arago/meta-arago-extras/recipes-core/meta/external-arago-toolchain.bb,
do_configure) failed with exit code '1'
NOTE: Tasks Summary: Attempted 258 tasks of which 251 didn't need to
be rerun and 1 failed.
Waiting for 0 running tasks to finish:

Summary: 1 task failed:
  /home/hutch/arago_7_11_2014_am1808/tisdk/sources/meta-arago/meta-arago-extras/recipes-core/meta/external-arago-toolchain.bb,
do_configure

So what I did is edit
tisdk/sources/meta-arago/meta-arago-extras/recipes-core/meta/external-arago-toolchain.bb
and replaced the LICENSE md5 with the value it calculated in the error
above and that fixed it.  So not sure if a recipe is busted or if I
hosed up something somehow but I thought I'd ask about it.

So what is the story with ARM9 AM1808?  Can I use Linaro toolchain yet
or is there still some compatibility issue that is best if I use the
Arago 2011.09?

Thanks for any ideas/pointers.

Regards,

Brian

