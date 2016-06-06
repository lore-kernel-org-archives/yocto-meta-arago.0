Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by arago-project.org (Postfix) with ESMTPS id A1CAA52A4F
	for <meta-arago@arago-project.org>;
	Mon,  6 Jun 2016 16:38:20 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id u56Gc90n024941;
	Mon, 6 Jun 2016 11:38:09 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id u56GcKDs025068;
	Mon, 6 Jun 2016 11:38:20 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 6 Jun 2016 11:38:20 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id u56GcK1k013901;
	Mon, 6 Jun 2016 11:38:20 -0500
Date: Mon, 6 Jun 2016 12:38:04 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Ankur Tyagi <ankur.tyagi85@gmail.com>
Message-ID: <20160606163804.GF13268@edge>
References: <CADySD0EkXbgZ6MWCv-Dco6g1B0+k4-dxh5BKJ5xqPBYcHQtHrA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CADySD0EkXbgZ6MWCv-Dco6g1B0+k4-dxh5BKJ5xqPBYcHQtHrA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-arago@arago-project.org
Subject: Re: tisdk-rootfs-image error when using arago-krogoth-config
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
X-List-Received-Date: Mon, 06 Jun 2016 16:38:20 -0000
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

On Sat, Jun 04, 2016 at 10:37:17PM +1200, Ankur Tyagi wrote:
> ​Hi,
> 
> I am trying to build tisdk-rootfs-image and getting following error:
> 
> http://pastebin.com/9SqudXGa

After looking at the log, I see that you are using Linaro 4.9 toolchain. That 
particular version of the toolchain had some packaging issues, which I worked 
with Linaro team to resolve in the next versions. Still, in order to use 4.9, 
I had to put some workarounds in corresponding recipes in Fido branch. Those 
were rather ugly and version specific, so I didn't cary them over to Krogoth. 
And on Krogoth we use Linaro 5.3 toolchain:

https://releases.linaro.org/components/toolchain/binaries/5.3-2016.02/
https://releases.linaro.org/components/toolchain/binaries/5.3-2016.02/arm-linux-gnueabihf/gcc-linaro-5.3-2016.02-x86_64_arm-linux-gnueabihf.tar.xz

-- 
Denys


> This is my build configuration:
> 
> Build Configuration:
> BB_VERSION        = "1.30.0"
> BUILD_SYS         = "x86_64-linux"
> NATIVELSBSTRING   = "Ubuntu-16.04"
> TARGET_SYS        = "arm-linux-gnueabi"
> MACHINE           = "am335x-evm"
> DISTRO            = "arago"
> DISTRO_VERSION    = "2016.05"
> TUNE_FEATURES     = "arm armv7a vfp thumb neon
> callconvention-hard       cortexa8"
> TARGET_FPU        = "hard"
> meta-arago-distro
> meta-arago-extras = "krogoth:01453ff0c02a472726f6dfe8f949abba55eab935"
> meta-qt5          = "krogoth:d715f2c1d340fa38f8a9860acc73de5e14a38b75"
> meta-networking
> meta-ruby
> meta-python
> meta-oe           = "krogoth:247b1267bbe95719cd4877d2d3cfbaf2a2f4865a"
> meta-ti           = "krogoth:1ae0cadb1200d0007a779958e852a48379d42c26"
> meta-linaro-toolchain = "krogoth:0f2a4dd08ab06768cc998fe3f7236e3942f4a2cc"
> meta              = "krogoth:b0b91490e4ede61a302eb547da2cc65aa7da87ff"
> 
> Any help is appreciated.
> 
> regards
> Ankur

> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago


