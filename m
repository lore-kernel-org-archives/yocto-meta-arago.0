Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [198.47.19.12])
	by arago-project.org (Postfix) with ESMTPS id 178B752A8C
	for <meta-arago@arago-project.org>;
	Sat, 25 Jun 2016 00:14:16 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id u5P0EFWg027634;
	Fri, 24 Jun 2016 19:14:16 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5P0EFvF009071;
	Fri, 24 Jun 2016 19:14:15 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Fri, 24 Jun 2016 19:14:15 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u5P0EF8A016073;
	Fri, 24 Jun 2016 19:14:15 -0500
Date: Fri, 24 Jun 2016 20:14:15 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Message-ID: <20160625001414.GX2177@edge>
References: <CADySD0EGJ7JMswXzHbMGDQeGCHB0yrqq+zNfaS+ck1TzXD4KPw@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADySD0EGJ7JMswXzHbMGDQeGCHB0yrqq+zNfaS+ck1TzXD4KPw@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: ncurses-native compile error when building daisy branch on Ubuntu 16.04 64bit host
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
X-List-Received-Date: Sat, 25 Jun 2016 00:14:16 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

http://lists.openembedded.org/pipermail/openembedded-core/2015-February/101820.html


On Sat, Jun 25, 2016 at 09:57:40AM +1200, Ankur Tyagi wrote:
> Hi,
> 
> I am trying to build arago daisy branch on Ubuntu 16.04 64bit host machine
> and I am getting this error:
> 
> http://pastebin.com/pRaEr2Te
> 
> Following is my build configuration
> ​:
> ​
> 
> Toolchain: gcc-linaro-arm-linux-gnueabihf-4.7-2013.03-20130313_linux
> (I have installed libstdc++6:i386 libncurses5:i386 libz1:i386 libc6:i386
> libc6-dev-i386)
> 
> Build Configuration:
> BB_VERSION        = "1.26.0"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "Ubuntu-16.04"
> TARGET_SYS        = "arm-linux-gnueabi"
> MACHINE           = "am335x-evm"
> DISTRO            = "arago"
> DISTRO_VERSION    = "2015.05"
> TUNE_FEATURES     = "armv7a vfp thumb neon callconvention-hard cortexa8"
> TARGET_FPU        = "vfp-neon"
> meta-ggl          = "master:9dbc979b22a14ddadc6359168420d369f5036225"
> meta-arago-distro
> meta-arago-extras = "daisy:f8c775ae64a26eb1182d515b2beb3544572bd799"
> meta-qt5          = "krogoth:d715f2c1d340fa38f8a9860acc73de5e14a38b75"
> toolchain-layer
> meta-networking
> meta-ruby
> meta-oe           = "daisy:d3d14d3fcca7fcde362cf0b31411dc4eea6d20aa"
> meta-ti           = "daisy:090b02a104924886afd0fa79be7b5d08eebf071f"
> meta-linaro-toolchain = "daisy:dbe0db0a1a5c015feb84ef689f48421594cb0b51"
> meta              = "daisy:a4e80e831cd13e6418af0d770c5dbd5b9270eaa5"
> 
> Is there a patch that fixes this problem ?
> 
> thanks
> Ankur

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


