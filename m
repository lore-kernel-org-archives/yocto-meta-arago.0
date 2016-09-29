Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by arago-project.org (Postfix) with ESMTPS id 59A3C52991
	for <meta-arago@arago-project.org>;
	Thu, 29 Sep 2016 20:24:55 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u8TKOqGP000311;
	Thu, 29 Sep 2016 15:24:52 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u8TKOqn5009317;
	Thu, 29 Sep 2016 15:24:52 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 29 Sep 2016 15:24:51 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u8TKOpBS024618;
	Thu, 29 Sep 2016 15:24:51 -0500
Date: Thu, 29 Sep 2016 16:24:51 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Message-ID: <20160929202451.GN7475@edge>
References: <CADySD0GqKG6vC=uAzRgsH4wR=UKGEpMH62pk+90GpCEG-9TqdQ@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADySD0GqKG6vC=uAzRgsH4wR=UKGEpMH62pk+90GpCEG-9TqdQ@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: linux-libc-headers and linux-ti-staging fetch errors
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
X-List-Received-Date: Thu, 29 Sep 2016 20:24:59 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Can you access this repository:
git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git

Try to see if you have git.ti.com blocked or require any proxy on your side.

-- 
Denys


On Fri, Sep 30, 2016 at 08:38:49AM +1300, Ankur Tyagi wrote:
> Hi,
> 
> I am getting fetch errors for linux-libc-headers and linux-ti-staging.
> I have tried removing build directory but every time I get this error:
> 
> ERROR: linux-libc-headers-4.4-r0.arago0 do_fetch: Fetcher failure:
> Fetch command failed with exit code 128, output:
> Cloning into bare repository
> '/home/ankur/arago/oe-layersetup/downloads/git2/git.ti.com.ti-linux-kernel.ti-linux-kernel.git'...
> fatal: read error: Connection reset by peer
> fatal: early EOF
> fatal: index-pack failed
> 
> ERROR: linux-libc-headers-4.4-r0.arago0 do_fetch: Function failed:
> Fetcher failure for URL:
> 'git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=ti-lsk-linux-4.4.y'.
> Unable to fetch URL from any source.
> ERROR: Logfile of failure stored in:
> /home/ankur/arago/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/armv7ahf-neon-linux-gnueabi/linux-libc-headers/4.4-r0.arago0/temp/log.do_fetch.3981
> ERROR: Task 787
> (/home/ankur/arago/oe-layersetup/sources/oe-core/meta/recipes-kernel/linux-libc-headers/linux-libc-headers_4.4.bb,
> do_fetch) failed with exit code '1'
> 
> ERROR: linux-ti-staging-4.4.21+gitAUTOINC+d42bcf7359-r22d.arago5
> do_fetch: Fetcher failure: Fetch command failed with exit code 128,
> output:
> Cloning into bare repository
> '/home/ankur/arago/oe-layersetup/downloads/git2/git.ti.com.ti-linux-kernel.ti-linux-kernel.git'...
> fatal: read error: Connection reset by peer
> fatal: early EOF
> fatal: index-pack failed
> 
> ERROR: linux-ti-staging-4.4.21+gitAUTOINC+d42bcf7359-r22d.arago5
> do_fetch: Function failed: Fetcher failure for URL:
> 'git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git;protocol=git;branch=ti-lsk-linux-4.4.y'.
> Unable to fetch URL from any source.
> ERROR: Logfile of failure stored in:
> /home/ankur/arago/oe-layersetup/build/arago-tmp-external-linaro-toolchain/work/beaglebone-linux-gnueabi/linux-ti-staging/4.4.21+gitAUTOINC+d42bcf7359-r22d.arago5/temp/log.do_fetch.4436
> ERROR: Task 52 (/home/ankur/arago/oe-layersetup/sources/meta-ti/recipes-kernel/linux/linux-ti-staging_4.4.bb,
> do_fetch) failed with exit code '1'
> 
> 
> Following is my build configuration
> 
> BB_VERSION        = "1.30.0"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "Ubuntu-16.04"
> TARGET_SYS        = "arm-linux-gnueabi"
> MACHINE           = "beaglebone"
> DISTRO            = "arago"
> DISTRO_VERSION    = "2016.08"
> TUNE_FEATURES     = "arm armv7a vfp thumb neon       callconvention-hard"
> TARGET_FPU        = "hard"
> meta-arago-distro
> meta-arago-extras = "krogoth:8cfe40ad0264888e81f0e960a11c89eccaba4a8b"
> meta-qt5          = "HEAD:48b4084675a15fe3fd10b58f54728dfaa2bd6c72"
> meta-networking
> meta-ruby
> meta-python
> meta-oe           = "krogoth:895b25b387cae428c38990f4d2747603ee9dc92d"
> meta-ti           = "krogoth:2bbab55c0aa8bb2279d7f3cf09d99156f60befc1"
> meta-linaro-toolchain
> meta-optee        = "krogoth:85faf6c6824597e7fd9e2d35fc9d8da2e9f90bc7"
> meta              = "krogoth:687d3b8d54aa3190bbbbc94ae2f91303fccf7c8d"
> 
> Is there anything that I can do ?
> 
> regards
> Ankur
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

