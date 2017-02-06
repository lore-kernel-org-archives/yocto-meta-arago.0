Return-Path: <denys@ti.com>
Received: from lelnx194.ext.ti.com (lelnx194.ext.ti.com [198.47.27.80])
	by arago-project.org (Postfix) with ESMTPS id 9CFFF529FB
	for <meta-arago@arago-project.org>;
	Mon,  6 Feb 2017 15:00:59 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id v16F0wcC028433;
	Mon, 6 Feb 2017 09:00:58 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id v16F0wcD006884;
	Mon, 6 Feb 2017 09:00:58 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 6 Feb 2017 09:00:58 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id v16F0w8o029126;
	Mon, 6 Feb 2017 09:00:58 -0600
Date: Mon, 6 Feb 2017 10:00:57 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Message-ID: <20170206150057.GA25590@edge>
References: <CADySD0GYzbgy90bbYg-Gvz+xS963pEOd0qUExa8TkHGC39U4cg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADySD0GYzbgy90bbYg-Gvz+xS963pEOd0qUExa8TkHGC39U4cg@mail.gmail.com>
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
X-List-Received-Date: Mon, 06 Feb 2017 15:01:00 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Feb 06, 2017 at 10:03:28PM +1300, Ankur Tyagi wrote:
> Hi,
> 
> I am getting following error when trying to bitbake tisdk-rootfs-image
> on morty branch
> 
> http://pastebin.com/RYjxsNXa
> 
> This is my build configuration:
> 
> Build Configuration:
> BB_VERSION        = "1.32.0"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "Ubuntu-16.04"
> TARGET_SYS        = "arm-linux-gnueabi"
> MACHINE           = "am335x-evm"
> DISTRO            = "arago"
> DISTRO_VERSION    = "2017.01"
> TUNE_FEATURES     = "arm armv7a vfp thumb neon       callconvention-hard"
> TARGET_FPU        = "hard"
> meta-arago-distro
> meta-arago-extras = "morty:6b2b36c1438b60388f56ce4e37771d6faf1dade8"
> meta-qt5          = "morty:4020adfd5198cf581eb20fbfd7d5b4c1a42fcdf4"
> meta-networking
> meta-ruby
> meta-python
> meta-oe           = "morty:1efa5d623bc64659b57389e50be2568b1355d5f7"
> meta-ti           = "morty:935753e93814a75db2072e5d1b31b759f835e95c"
> meta-linaro-toolchain
> meta-optee        = "morty:d4639deb43bb6c62ac06aaf951245edc9b9f410e"
> meta              = "morty:79f821fb6c1b425ca5cb5e6db360c2743d6c989e"

Can you check if external-linaro-toolchain-cross in your dependency tree:

$ bitbake tisdk-rootfs-image -g
$ grep external-linaro-toolchain-cross *.dot

-- 
Denys

