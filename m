Return-Path: <nm@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 682D4C433FE
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 18:26:06 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web08.1050.1650997563802444147
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 11:26:04 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=gWSndzXH;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: nm@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23QIPwRp079447;
	Tue, 26 Apr 2022 13:25:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1650997558;
	bh=rmylMf8tco0yLjfBY+H0GFEXXb/T3n54WwQzAMuK7n8=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=gWSndzXHrg+YZZf87+gdbLiZjvuZhIFihmafe0zIRQb8mqXMIrFvMvIvXqUmoy5Dn
	 /E7l4Ol9tgTBO3KEK0g6hmhC+GcI/tVlUhJ6NBGUdcK0M+klbHP0utS4WjyzDcUPw0
	 w2rcLuL9bgd0zPDRSUMi7Z1S0XN5JNhlj8fi/NT4=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23QIPw3S046910
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 26 Apr 2022 13:25:58 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 26
 Apr 2022 13:25:58 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 26 Apr 2022 13:25:58 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23QIPwVb023429;
	Tue, 26 Apr 2022 13:25:58 -0500
Date: Tue, 26 Apr 2022 13:25:58 -0500
From: Nishanth Menon <nm@ti.com>
To: Andrew Davis <afd@ti.com>
CC: Denys Dmytriyenko <denis@denix.org>, Ryan Eatmon <reatmon@ti.com>,
        <meta-arago@lists.yoctoproject.org>
Subject: Re: [meta-arago] [oe-layersetup PATCH] oe-layer-setup.sh: Stop
 claiming generic sh support
Message-ID: <20220426182558.yyxcxitwqarjbemc@sandworm>
References: <20220426142651.22361-1-nm@ti.com>
 <06b88161-bfc8-ea5d-be90-63533e472c48@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <06b88161-bfc8-ea5d-be90-63533e472c48@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 26 Apr 2022 18:26:06 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13792

On 09:35-20220426, Andrew Davis wrote:
> On 4/26/22 9:26 AM, Nishanth Menon via lists.yoctoproject.org wrote:
> > Lets be clear that we work with bash and not variants such as dash.
> > 
> > Signed-off-by: Nishanth Menon <nm@ti.com>
> > ---
> > 
> > There has been a bit of bashism that has crept into various checks,
> > which is fine as long as folks use bash ;) OR we can start cleaning up
> > in a manner to support dash and variants of that form.
> > 
> 
> 
> I'd rather just fix the bashisms, this fixes us at least enough
> to get dash back working:

> 
> 
> From 4e46cf04046aee084b4e83cef28d4500d1d3dc56 Mon Sep 17 00:00:00 2001
> From: Andrew Davis <afd@ti.com>
> Date: Mon, 25 Apr 2022 16:31:35 -0500
> Subject: [PATCH] Fix non-standard shell usage
> 
> Signed-off-by: Andrew Davis <afd@ti.com>
> ---
>  oe-layertool-setup.sh | 4 ++--
>  1 file changed, 2 insertions(+), 2 deletions(-)
> 
> diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
> index f171f94..e05737b 100755
> --- a/oe-layertool-setup.sh
> +++ b/oe-layertool-setup.sh
> @@ -780,7 +780,7 @@ print_image_names() {
>      for FOLDER in ${FOLDERS}
>      do
>          RECO=""
> -        if [ "${FOLDER}" == "meta-arago" ]; then
> +        if [ "${FOLDER}" = "meta-arago" ]; then
>              RECO="[recommended]"
>          fi
>          echo "From ${FOLDER}${RECO}:"
> @@ -796,7 +796,7 @@ print_image_names() {
>                      if [ -z "${summary}" ]; then
>                          summary="No Summary available"
>                      fi
> -                    echo -e "\t${name}: ${summary}"
> +                    echo "    ${name}: ${summary}"


Yep, fair enough - I am still not a dash fan. could you post this as an
formal patch?

>                  done
>              fi
>          done
> -- 
> 2.17.1
> 
> 
> >   oe-layertool-setup.sh | 2 +-
> >   1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
> > index f171f94cf0fc..6654869ac061 100755
> > --- a/oe-layertool-setup.sh
> > +++ b/oe-layertool-setup.sh
> > @@ -1,4 +1,4 @@
> > -#!/bin/sh
> > +#!/bin/bash
> >   # OE Build Enviroment Setup Script
> >   #

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

