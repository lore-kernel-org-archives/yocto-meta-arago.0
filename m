Return-Path: <praneeth@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 1FBDF52A70
	for <meta-arago@arago-project.org>;
	Wed, 10 Mar 2021 17:29:51 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12AHU5nM109870
	for <meta-arago@arago-project.org>; Wed, 10 Mar 2021 11:30:05 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1615397405;
	bh=uDSsLo9at636LX8J52fcTufVlUE7G4NTo5AvvJY6cCo=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=F9aP7IX+Druvs9Be4WBm4W0snaE/e559i21m/lJdc5+hpBvWEj0HHOa+UW1Q2bw/c
	fiatu19FzppwvMQjyUQaLMNSiRJiqehlJMcUQwCVG0Qg2HIkt/v0S3qox49LneJ8re
	jzEB+zEqd6b5nz/CScYX0AVL2qaq9gukazRZdBJA=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12AHU54e089257
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 10 Mar 2021 11:30:05 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Wed, 10 Mar 2021 11:30:05 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Wed, 10 Mar 2021 11:30:05 -0600
Received: from [10.250.50.222] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12AHU44J015241;
	Wed, 10 Mar 2021 11:30:04 -0600
To: Nikhil Devshatwar <nikhil.nd@ti.com>, <meta-arago@arago-project.org>
References: <20210303182136.31765-1-nikhil.nd@ti.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
Message-ID: <8d2e4f84-1c71-bbf7-8d04-7ccb9725db71@ti.com>
Date: Wed, 10 Mar 2021 11:30:04 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <20210303182136.31765-1-nikhil.nd@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: lokeshvutla@ti.com, saurabhnarang@ti.com, hnagalla@ti.com, nsekhar@ti.com,
	kishon@ti.com
Subject: Re: [meta-ti][dunfell/master][PATCH v2] packagegroups: tisdk-connectivity: Include TI wlan packages for k3 platforms
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
X-List-Received-Date: Wed, 10 Mar 2021 17:29:51 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/3/2021 12:21 PM, Nikhil Devshatwar wrote:
> Currently, the K3 platforms do not include the TI wlan related packages.
> Add in the tisdk-connectivity packagegroup.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> Suggested-by: Hari Nagalla <hnagalla@gmail.com>
> Reviewed-by: Lokesh Vutla <lokeshvutla@ti.com>
> ---
> 
> Notes:
>      changes from v1:

s/meta-ti/meta-arago. Please point to right project next time.

>      
>      * Drop the new recipe and simply include the existing packages for wilink
>        This way, all the platforms are using the same recipes and we don't
>        have to maintain any new recipe just for the am64xx-sk
>        The firmare will get picked from the repo
>        git://git.ti.com/wilink8-wlan/wl18xx_fw.git
> 
>   .../packagegroups/packagegroup-arago-tisdk-connectivity.bb       | 1 +
>   1 file changed, 1 insertion(+)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> index 11109432..ab632924 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> @@ -89,6 +89,7 @@ CONNECTIVITY_RDEPENDS_append_dra7xx = "\
>   CONNECTIVITY_RDEPENDS_append_k3 = "\
>       ${WLAN_COMMON} \
>       ${BT_COMMON} \
> +    ${WLAN_TI} \
>   "

Looks like WLAN_TI and WLAN_COMMON is valid for all platforms defined in 
this packagegroup.

why not move both of them under CONNECTIVITY_RDEPENDS without a specific 
platform append?.

>   
>   RDEPENDS_${PN} = "\
> 

