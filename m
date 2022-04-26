Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1A56CC433F5
	for <webhook@archiver.kernel.org>; Tue, 26 Apr 2022 14:36:00 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web09.7498.1650983757475109331
 for <meta-arago@lists.yoctoproject.org>;
 Tue, 26 Apr 2022 07:35:57 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=iTAPJvJu;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 23QEZr95053659;
	Tue, 26 Apr 2022 09:35:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1650983753;
	bh=lUlN881+aDPeYzZD+aj2wBRIRfHS3XlqR66LB29h9Gw=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=iTAPJvJuZmJ5a6aV2c0rWdkeI+Cs2Mg5YaZbqCb0ydOIo4wU69XGS4/ncoueOHl+n
	 ZRIasO8Qaf6LwHen/S9Uc/T5UZ0fMFINpPSXLtkYWEaq1oIA0X1XPqoI0LYOFkdFSA
	 ZCAJtAIFAJKjUwSDMJTeZxHkOWLC0M2PbQUEgLIE=
Received: from DLEE100.ent.ti.com (dlee100.ent.ti.com [157.170.170.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 23QEZrmr038173
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 26 Apr 2022 09:35:53 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Tue, 26
 Apr 2022 09:35:52 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Tue, 26 Apr 2022 09:35:52 -0500
Received: from [10.250.34.159] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 23QEZqhG044463;
	Tue, 26 Apr 2022 09:35:52 -0500
Message-ID: <06b88161-bfc8-ea5d-be90-63533e472c48@ti.com>
Date: Tue, 26 Apr 2022 09:35:52 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: [meta-arago] [oe-layersetup PATCH] oe-layer-setup.sh: Stop
 claiming generic sh support
Content-Language: en-US
To: <nm@ti.com>, Denys Dmytriyenko <denis@denix.org>,
        Ryan Eatmon
	<reatmon@ti.com>
CC: <meta-arago@lists.yoctoproject.org>
References: <20220426142651.22361-1-nm@ti.com>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20220426142651.22361-1-nm@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-arago.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-arago@lists.yoctoproject.org>; Tue, 26 Apr 2022 14:36:00 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-arago/message/13788

On 4/26/22 9:26 AM, Nishanth Menon via lists.yoctoproject.org wrote:
> Lets be clear that we work with bash and not variants such as dash.
> 
> Signed-off-by: Nishanth Menon <nm@ti.com>
> ---
> 
> There has been a bit of bashism that has crept into various checks,
> which is fine as long as folks use bash ;) OR we can start cleaning up
> in a manner to support dash and variants of that form.
> 


I'd rather just fix the bashisms, this fixes us at least enough
to get dash back working:


 From 4e46cf04046aee084b4e83cef28d4500d1d3dc56 Mon Sep 17 00:00:00 2001
From: Andrew Davis <afd@ti.com>
Date: Mon, 25 Apr 2022 16:31:35 -0500
Subject: [PATCH] Fix non-standard shell usage

Signed-off-by: Andrew Davis <afd@ti.com>
---
  oe-layertool-setup.sh | 4 ++--
  1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
index f171f94..e05737b 100755
--- a/oe-layertool-setup.sh
+++ b/oe-layertool-setup.sh
@@ -780,7 +780,7 @@ print_image_names() {
      for FOLDER in ${FOLDERS}
      do
          RECO=""
-        if [ "${FOLDER}" == "meta-arago" ]; then
+        if [ "${FOLDER}" = "meta-arago" ]; then
              RECO="[recommended]"
          fi
          echo "From ${FOLDER}${RECO}:"
@@ -796,7 +796,7 @@ print_image_names() {
                      if [ -z "${summary}" ]; then
                          summary="No Summary available"
                      fi
-                    echo -e "\t${name}: ${summary}"
+                    echo "    ${name}: ${summary}"
                  done
              fi
          done
-- 
2.17.1


>   oe-layertool-setup.sh | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/oe-layertool-setup.sh b/oe-layertool-setup.sh
> index f171f94cf0fc..6654869ac061 100755
> --- a/oe-layertool-setup.sh
> +++ b/oe-layertool-setup.sh
> @@ -1,4 +1,4 @@
> -#!/bin/sh
> +#!/bin/bash
>   
>   # OE Build Enviroment Setup Script
>   #

