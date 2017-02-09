Return-Path: <denys@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 1266252AA0
	for <meta-arago@arago-project.org>;
	Thu,  9 Feb 2017 17:52:03 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v19Hq2OK005421;
	Thu, 9 Feb 2017 11:52:02 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v19Hq29r003367;
	Thu, 9 Feb 2017 11:52:02 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.294.0;
	Thu, 9 Feb 2017 11:52:02 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v19Hq2CZ009113;
	Thu, 9 Feb 2017 11:52:02 -0600
Date: Thu, 9 Feb 2017 12:51:59 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Message-ID: <20170209175159.GE2612@edge>
References: <CADySD0GYzbgy90bbYg-Gvz+xS963pEOd0qUExa8TkHGC39U4cg@mail.gmail.com>
	<20170206150057.GA25590@edge>
	<CADySD0EusK8rAZRf9zk7P6RiMT9BRWWcLaufU0+vjzoCVqBB5Q@mail.gmail.com>
	<CADySD0EGhpRTk3j-LaystCccUkaNvkiPtZ7hrPKC+ep5KM5QTA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADySD0EGhpRTk3j-LaystCccUkaNvkiPtZ7hrPKC+ep5KM5QTA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: tisdk-rootfs-image recipe bitbake error on morty branch
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
X-List-Received-Date: Thu, 09 Feb 2017 17:52:03 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Seems fine and should work. Try removing your temp dir and run again.


On Fri, Feb 10, 2017 at 06:34:27AM +1300, Ankur Tyagi wrote:
> Hi Denys,
> 
> Anything that you would like me to try in order to fix this error ?
> 
> thanks
> Ankur
> 
> On Tue, Feb 7, 2017 at 5:21 PM, Ankur Tyagi <ankur.tyagi85@gmail.com> wrote:
> > Hi,
> >
> > Here is the log
> >
> > On Tue, Feb 7, 2017 at 4:00 AM, Denys Dmytriyenko <denys@ti.com> wrote:
> >> On Mon, Feb 06, 2017 at 10:03:28PM +1300, Ankur Tyagi wrote:
> >>> Hi,
> >>>
> >>> I am getting following error when trying to bitbake tisdk-rootfs-image
> >>> on morty branch
> >>>
> >>> http://pastebin.com/RYjxsNXa
> >>>
> >>> This is my build configuration:
> >>>
> >>> Build Configuration:
> >>> BB_VERSION        = "1.32.0"
> >>> BUILD_SYS         = "x86_64-linux"
> >>> NATIVELSBSTRING   = "Ubuntu-16.04"
> >>> TARGET_SYS        = "arm-linux-gnueabi"
> >>> MACHINE           = "am335x-evm"
> >>> DISTRO            = "arago"
> >>> DISTRO_VERSION    = "2017.01"
> >>> TUNE_FEATURES     = "arm armv7a vfp thumb neon       callconvention-hard"
> >>> TARGET_FPU        = "hard"
> >>> meta-arago-distro
> >>> meta-arago-extras = "morty:6b2b36c1438b60388f56ce4e37771d6faf1dade8"
> >>> meta-qt5          = "morty:4020adfd5198cf581eb20fbfd7d5b4c1a42fcdf4"
> >>> meta-networking
> >>> meta-ruby
> >>> meta-python
> >>> meta-oe           = "morty:1efa5d623bc64659b57389e50be2568b1355d5f7"
> >>> meta-ti           = "morty:935753e93814a75db2072e5d1b31b759f835e95c"
> >>> meta-linaro-toolchain
> >>> meta-optee        = "morty:d4639deb43bb6c62ac06aaf951245edc9b9f410e"
> >>> meta              = "morty:79f821fb6c1b425ca5cb5e6db360c2743d6c989e"
> >>
> >> Can you check if external-linaro-toolchain-cross in your dependency tree:
> >>
> >> $ bitbake tisdk-rootfs-image -g
> >> $ grep external-linaro-toolchain-cross *.dot
> >>
> >> --
> >> Denys

