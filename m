Return-Path: <ankur.tyagi85@gmail.com>
Received: from mail-yb0-f178.google.com (mail-yb0-f178.google.com
	[209.85.213.178])
	by arago-project.org (Postfix) with ESMTPS id C791052975
	for <meta-arago@arago-project.org>;
	Thu, 29 Sep 2016 19:39:09 +0000 (UTC)
Received: by mail-yb0-f178.google.com with SMTP id t5so20930064yba.2
	for <meta-arago@arago-project.org>;
	Thu, 29 Sep 2016 12:39:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=mime-version:from:date:message-id:subject:to;
	bh=kFyJZZ+FClSJ461RMd1EaZDLLD8E3Hsuvl5/7q5xA2U=;
	b=au4KHtBeupkWKQhHoy60M7maEjD4GBK98Az+NKTvu0DUb44DvOUc4ZS/tE8nzmyV81
	2up+r83PLd3LSVBIE8Kgj4IPfEY0r8Jfh++dftpr/fkUqHSaIeOVIo6KDbgdrS9AOcBq
	nxm+zAk/dlzTpiMGq6g+VhyudOa7KMpjouDi6goNMXaJ/IWF0+5tkCc4wG2zGJb8F3QF
	G8MSJFJIwB6mh4RLvrr7FfeV9xDWHq5R1vnmgmjix1cwAtx06QUoYQo6hvzcfmz1UpZs
	DURsHxHJStg+AjcI3TRuqanspG2HdXoUcQmwSJevXADGIYI/2CG1YQhq0ogVRfMcjKMQ
	SBZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20130820;
	h=x-gm-message-state:mime-version:from:date:message-id:subject:to;
	bh=kFyJZZ+FClSJ461RMd1EaZDLLD8E3Hsuvl5/7q5xA2U=;
	b=PnqNaygifS25L1oiAOoGrEAaAjREfApJTFPS3cGnMSNSqzfwRFtXj9YrDoiCyAAlJ3
	Yfg7ZpPu2oJ614SrLAVcTDpOeXYfMRNbWQd2IRGmy6SVdWlUyjtAoqX1Ar+zPn8SLBp1
	5hjiYsXPnNx5VQwI/YBxxQ/u20RrYqXufM7xh8JUF+cWBkFCyd8EoqyEDKsjbTDoGyb9
	Rsm6yJsNRJV5owtccr/a+9SWJp5mqaq1e4sDyCydH2G1C8Xi5rNuL6Wo/9Gmnka/3r84
	mP60+xbtIX4Mp7lK1Liz7dSAZBcBhpUerwgyvTJxyoD2ZPHzE2qNQOxjc3gLvvk8PRct
	b8Pw==
X-Gm-Message-State: AA6/9RmCl7QYJpu07A7Nj5PSZyHfCVRDbbcSvw0MtYpfMiGOddWR2F3x8jvBo7BlGz3eCq6Raf/dv1AW8+aHBg==
X-Received: by 10.37.97.21 with SMTP id v21mr2014047ybb.177.1475177949520;
	Thu, 29 Sep 2016 12:39:09 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.83.6.14 with HTTP; Thu, 29 Sep 2016 12:38:49 -0700 (PDT)
From: Ankur Tyagi <ankur.tyagi85@gmail.com>
Date: Fri, 30 Sep 2016 08:38:49 +1300
Message-ID: <CADySD0GqKG6vC=uAzRgsH4wR=UKGEpMH62pk+90GpCEG-9TqdQ@mail.gmail.com>
To: meta-arago@arago-project.org
Subject: linux-libc-headers and linux-ti-staging fetch errors
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
X-List-Received-Date: Thu, 29 Sep 2016 19:39:10 -0000
Content-Type: text/plain; charset=UTF-8

Hi,

I am getting fetch errors for linux-libc-headers and linux-ti-staging.
I have tried removing build directory but every time I get this error:

ERROR: linux-libc-headers-4.4-r0.arago0 do_fetch: Fetcher failure:
Fetch command failed with exit code 128, output:
Cloning into bare repository
'/home/ankur/arago/oe-layersetup/downloads/git2/git.ti.com.ti-linux-kernel.ti-linux-kernel.git'...
fatal: read error: Connection reset by peer
fatal: early EOF
fatal: index-pack failed

ERROR: linux-libc-headers-4.4-r0.arago0 do_fetch: Function failed:
Fetcher failure for URL:
'git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=ti-lsk-linux-4.4.y'.
Unable to fetch URL from any source.
ERROR: Logfile of failure stored in:
/home/ankur/arago/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/armv7ahf-neon-linux-gnueabi/linux-libc-headers/4.4-r0.arago0/temp/log.do_fetch.3981
ERROR: Task 787
(/home/ankur/arago/oe-layersetup/sources/oe-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.4.bb,
do_fetch) failed with exit code '1'

ERROR: linux-ti-staging-4.4.21+gitAUTOINC+d42bcf7359-r22d.arago5
do_fetch: Fetcher failure: Fetch command failed with exit code 128,
output:
Cloning into bare repository
'/home/ankur/arago/oe-layersetup/downloads/git2/git.ti.com.ti-linux-kernel.ti-linux-kernel.git'...
fatal: read error: Connection reset by peer
fatal: early EOF
fatal: index-pack failed

ERROR: linux-ti-staging-4.4.21+gitAUTOINC+d42bcf7359-r22d.arago5
do_fetch: Function failed: Fetcher failure for URL:
'git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=ti-lsk-linux-4.4.y'.
Unable to fetch URL from any source.
ERROR: Logfile of failure stored in:
/home/ankur/arago/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/beaglebone-linux-gnueabi/linux-ti-staging/4.4.21+gitAUTOINC+d42bcf7359-r22d.arago5/temp/log.do_fetch.4436
ERROR: Task 52 (/home/ankur/arago/oe-layersetup/sources/meta-ti/recipes-kernel/linux/linux-ti-staging_4.4.bb,
do_fetch) failed with exit code '1'


Following is my build configuration

BB_VERSION        = "1.30.0"
BUILD_SYS         = "x86_64-linux"
NATIVELSBSTRING   = "Ubuntu-16.04"
TARGET_SYS        = "arm-linux-gnueabi"
MACHINE           = "beaglebone"
DISTRO            = "arago"
DISTRO_VERSION    = "2016.08"
TUNE_FEATURES     = "arm armv7a vfp thumb neon       callconvention-hard"
TARGET_FPU        = "hard"
meta-arago-distro
meta-arago-extras = "krogoth:8cfe40ad0264888e81f0e960a11c89eccaba4a8b"
meta-qt5          = "HEAD:48b4084675a15fe3fd10b58f54728dfaa2bd6c72"
meta-networking
meta-ruby
meta-python
meta-oe           = "krogoth:895b25b387cae428c38990f4d2747603ee9dc92d"
meta-ti           = "krogoth:2bbab55c0aa8bb2279d7f3cf09d99156f60befc1"
meta-linaro-toolchain
meta-optee        = "krogoth:85faf6c6824597e7fd9e2d35fc9d8da2e9f90bc7"
meta              = "krogoth:687d3b8d54aa3190bbbbc94ae2f91303fccf7c8d"

Is there anything that I can do ?

regards
Ankur

