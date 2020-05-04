Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 20EF4529A8
	for <meta-arago@arago-project.org>;
	Mon,  4 May 2020 21:19:12 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 044LGnMi097667;
	Mon, 4 May 2020 16:16:49 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1588627009;
	bh=zEqxo4g3ygGGM9toPhJSNFSbwnMjHcNkSt48GyN2LrM=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=lV5MLwDewmgZBh0WSeM/xyMT7k5Kcq9XS6wUtZGFqxQShJZY/Iw1x+dZuhO2CfK3V
	vRfbPbJQDtD3Nwd4arbA1RthtQjieDrRYC9VFGshOrpbApwxXdrQL6+cuGpEx3vUA1
	Ydqxwdz05kr6AOXGA7YLrndw5JcHfC2GTYSOuW9o=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTP id 044LGn7r081487;
	Mon, 4 May 2020 16:16:49 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Mon, 4 May 2020 16:16:49 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Mon, 4 May 2020 16:16:49 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 044LGmLn092760;
	Mon, 4 May 2020 16:16:49 -0500
Date: Mon, 4 May 2020 17:16:48 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Stiffler, Jacob" <j-stiffler@ti.com>
Message-ID: <20200504211648.GE31934@beryl>
References: <1588625682-33592-1-git-send-email-denis@denix.org>
	<1588625682-33592-2-git-send-email-denis@denix.org>
	<6fc6e6c601214fc083d666da2a7aff60@ti.com>
MIME-Version: 1.0
In-Reply-To: <6fc6e6c601214fc083d666da2a7aff60@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [EXTERNAL] [master][PATCH 2/4] toolchain: remove secondary toolchain hack
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
X-List-Received-Date: Mon, 04 May 2020 21:19:12 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, May 04, 2020 at 09:06:32PM +0000, Stiffler, Jacob wrote:
> This was for adding the R5 toolchain into the devkit so that we can build 
> the R5 u-boot from the SDK.

Which would have to be done properly now, following multiconfig changes in 
meta-ti, not as a hack, which won't work and conflicts with those changes...

This is unfortunate, but is necessary for many existing and upcoming features.


> > -----Original Message-----
> > From: meta-arago-bounces@arago-project.org [mailto:meta-arago-
> > bounces@arago-project.org] On Behalf Of Denys Dmytriyenko
> > Sent: Monday, May 04, 2020 4:55 PM
> > To: meta-arago@arago-project.org
> > Subject: [EXTERNAL] [meta-arago] [master][PATCH 2/4] toolchain: remove
> > secondary toolchain hack
> > 
> > From: Denys Dmytriyenko <denys@ti.com>
> > 
> > With K3 R5F support in meta-ti now, this hack is no longer needed.
> > 
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> > ---
> >  meta-arago-distro/conf/distro/include/toolchain-arm.inc        |  6 ------
> >  .../recipes-core/meta/external-arm-secondary-sdk-toolchain.bb  |  4 ----
> >  .../packagegroups/packagegroup-cross-canadian.bbappend         | 10 ---------
> > -
> >  3 files changed, 20 deletions(-)
> >  delete mode 100644 meta-arago-distro/recipes-core/meta/external-arm-
> > secondary-sdk-toolchain.bb
> >  delete mode 100644 meta-arago-distro/recipes-
> > core/packagegroups/packagegroup-cross-canadian.bbappend
> > 
> > diff --git a/meta-arago-distro/conf/distro/include/toolchain-arm.inc
> > b/meta-arago-distro/conf/distro/include/toolchain-arm.inc
> > index d2c2b2f..fd63256 100644
> > --- a/meta-arago-distro/conf/distro/include/toolchain-arm.inc
> > +++ b/meta-arago-distro/conf/distro/include/toolchain-arm.inc
> > @@ -9,9 +9,6 @@ EAT_TARGET_SYS_arm = "${EAT_TARGET_SYS_ARMV5}"
> >  EAT_TARGET_SYS_armv7a = "${EAT_TARGET_SYS_ARMV7}"
> >  EAT_TARGET_SYS_aarch64 = "${EAT_TARGET_SYS_ARMV8}"
> > 
> > -SECONDARY_TARGET_ARCH = ""
> > -SECONDARY_TARGET_ARCH_k3 = "armv7a"
> > -
> >  TARGET_VENDOR = ""
> > 
> >  TOOLCHAIN_BASE ?= "/opt"
> > @@ -34,9 +31,6 @@ PREFERRED_PROVIDER_gcc-cross-canadian-
> > ${TRANSLATED_TARGET_ARCH} ?= "external-arm
> >  PREFERRED_PROVIDER_binutils-cross-canadian-
> > ${TRANSLATED_TARGET_ARCH} ?= "external-arm-sdk-toolchain"
> >  #PREFERRED_PROVIDER_gdb-cross-canadian-
> > ${TRANSLATED_TARGET_ARCH} = "external-arm-sdk-toolchain"
> > 
> > -PREFERRED_PROVIDER_gcc-cross-canadian-${SECONDARY_TARGET_ARCH}
> > ?= "external-arm-secondary-sdk-toolchain"
> > -PREFERRED_PROVIDER_binutils-cross-canadian-
> > ${SECONDARY_TARGET_ARCH} ?= "external-arm-secondary-sdk-toolchain"
> > -
> >  # Special case for gdb to be built as part of canadian-cross-sdk, instead of
> > packaged from external toolchain
> >  bindir_pn-gdb-cross-canadian-${TRANSLATED_TARGET_ARCH} =
> > "${exec_prefix}/bin"
> >  PREFERRED_PROVIDER_gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}
> > = "gdb-cross-canadian-${TRANSLATED_TARGET_ARCH}"
> > diff --git a/meta-arago-distro/recipes-core/meta/external-arm-secondary-
> > sdk-toolchain.bb b/meta-arago-distro/recipes-core/meta/external-arm-
> > secondary-sdk-toolchain.bb
> > deleted file mode 100644
> > index 22a8aa0..0000000
> > --- a/meta-arago-distro/recipes-core/meta/external-arm-secondary-sdk-
> > toolchain.bb
> > +++ /dev/null
> > @@ -1,4 +0,0 @@
> > -TARGET_ARCH := "${SECONDARY_TARGET_ARCH}"
> > -MACHINEOVERRIDES := "${SECONDARY_TARGET_ARCH}"
> > -
> > -require recipes-core/meta/external-arm-sdk-toolchain.bb
> > diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-
> > cross-canadian.bbappend b/meta-arago-distro/recipes-
> > core/packagegroups/packagegroup-cross-canadian.bbappend
> > deleted file mode 100644
> > index fb728e0..0000000
> > --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-cross-
> > canadian.bbappend
> > +++ /dev/null
> > @@ -1,10 +0,0 @@
> > -PR_append = ".arago0"
> > -
> > -SECONDARY_TARGET_ARCH ?= ""
> > -
> > -SECONDARY_TOOLCHAIN = "gcc-cross-canadian-
> > ${SECONDARY_TARGET_ARCH} \
> > -                       binutils-cross-canadian-${SECONDARY_TARGET_ARCH}"
> > -
> > -RDEPENDS_${PN}_append = " \
> > -    ${@oe.utils.conditional('SECONDARY_TARGET_ARCH', '', '',
> > '${SECONDARY_TOOLCHAIN}', d)} \
> > -"
> > --
> > 2.7.4
> > 
> > _______________________________________________
> > meta-arago mailing list
> > meta-arago@arago-project.org
> > http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

