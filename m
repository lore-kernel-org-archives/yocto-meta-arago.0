Return-Path: <denys@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id 84BA852998
	for <meta-arago@arago-project.org>;
	Thu,  1 Aug 2019 15:41:11 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x71FeHGj094714
	for <meta-arago@arago-project.org>; Thu, 1 Aug 2019 10:40:17 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1564674017;
	bh=qDBTWkeTDOuPsx33GD9h/Ah3B9sYNpz457jZlo8enUU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=FBCyM8Ms1prR8kWm5YwobCMWL9z0FGcNDEw93nFTTgKKpViYgvPsvVxrDTqrl3Mtu
	QOdvEb4MmXlVeWbMPabK/cb6kCOP20xDPHhxZo3f9l6aT3lCA6S0RKMYrlz2yIBl1G
	01n+vCg6sq2xm9cwfPFx1Jeiqo086Srgm0SaFmgo=
Received: from DLEE109.ent.ti.com (dlee109.ent.ti.com [157.170.170.41])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x71FeHp4024985
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 1 Aug 2019 10:40:17 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 1 Aug 2019 10:40:17 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 1 Aug 2019 10:40:17 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x71FeGvf036311;
	Thu, 1 Aug 2019 10:40:16 -0500
Date: Thu, 1 Aug 2019 11:40:15 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20190801154014.GD20944@beryl>
References: <1564665868-14785-1-git-send-email-j-stiffler@ti.com>
MIME-Version: 1.0
In-Reply-To: <1564665868-14785-1-git-send-email-j-stiffler@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [master/thud][PATCH] packagegroup-arago-base: add avahi-utils along with zeroconf
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
X-List-Received-Date: Thu, 01 Aug 2019 15:41:12 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Not sure adding to the base is a good idea here...


On Thu, Aug 01, 2019 at 09:24:28AM -0400, Jacob Stiffler wrote:
> Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> ---
>  meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
> index 4094d90..cc601b0 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-base.bb
> @@ -31,7 +31,7 @@ ARAGO_EXTRA = "\
>  
>  # minimal set of packages - needed to boot
>  RDEPENDS_${PN} = "\
> -    ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'packagegroup-base-zeroconf', '',d)} \
> +    ${@bb.utils.contains('DISTRO_FEATURES', 'zeroconf', 'packagegroup-base-zeroconf avahi-utils', '',d)} \
>      ${@bb.utils.contains('MACHINE_FEATURES', 'alsa', '${ARAGO_ALSA_BASE}', '',d)} \
>      ${ARAGO_BASE} \
>      ${ARAGO_EXTRA} \
> -- 
> 2.7.4
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

