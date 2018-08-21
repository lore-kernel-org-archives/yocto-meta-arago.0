Return-Path: <denys@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 0C4C9529F1
	for <meta-arago@arago-project.org>;
	Tue, 21 Aug 2018 22:17:32 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id w7LMHPRK079757
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2018 17:17:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1534889845;
	bh=ds1kTAVPVcaG+rQv2+3SW2OXVoJG32osKmcgP0cEwx4=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=cjI7EhCDxk+H+gMbB90D5MH7SIWgaFidGwCDUbKSFzT8zUfnfzcmq1wA65dchLzJy
	NSjYjFTgZc59WtsOPIHPBaE/6ggCvh3r2gS79aKx6xHbxIBEzTBnl+EXYRfokDwaZn
	uLCnklSV72i5OFQytA6BMdrL94bxvl/ixhqhPvrE=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7LMHPwm005031
	for <meta-arago@arago-project.org>; Tue, 21 Aug 2018 17:17:25 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE115.ent.ti.com
	(10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Tue, 21 Aug 2018 17:17:25 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Tue, 21 Aug 2018 17:17:25 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w7LMHPOX017837;
	Tue, 21 Aug 2018 17:17:25 -0500
Date: Tue, 21 Aug 2018 18:16:28 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20180821221628.GY29422@beryl>
References: <1534889027-32133-2-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1534889027-32133-2-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [PATCH v2 2/3] packagegroup-arago-cross-canadian: add SECONDARY_TOOLCHAIN
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
X-List-Received-Date: Tue, 21 Aug 2018 22:17:33 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Aug 21, 2018 at 06:03:46PM -0400, Jacob Stiffler wrote:
> * Add the secondary toolchain to the devkit
>   if SECONDARY_TOOLCHAIN_ARCH is defined.

SECONDARY_TARGET_ARCH?


> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
> v2 changes:
> * initialize SECONDARY_TOOLCHAIN_ARCH
> 
>  .../packagegroups/packagegroup-arago-cross-canadian.bbappend   | 10 ++++++++++
>  1 file changed, 10 insertions(+)
>  create mode 100644 meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bbappend
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bbappend b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bbappend
> new file mode 100644
> index 0000000..b05e493
> --- /dev/null
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-cross-canadian.bbappend
> @@ -0,0 +1,10 @@
> +PR_append = ".arago0"
> +
> +SECONDARY_TARGET_ARCH ?= ""
> +
> +SECONDARY_TOOLCHAIN = "gcc-cross-canadian-${SECONDARY_TARGET_ARCH} \
> +                       binutils-cross-canadian-${SECONDARY_TARGET_ARCH}"
> +
> +RDEPENDS_${PN}_append = " \
> +    ${@base_conditional('SECONDARY_TARGET_ARCH', '', '', '${SECONDARY_TOOLCHAIN}', d)} \
> +"
> -- 
> 2.7.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

