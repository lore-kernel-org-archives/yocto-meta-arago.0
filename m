Return-Path: <praneeth@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 1720352AA7
	for <meta-arago@arago-project.org>;
	Fri, 12 Mar 2021 16:36:49 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12CGb4Id113355
	for <meta-arago@arago-project.org>; Fri, 12 Mar 2021 10:37:04 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1615567024;
	bh=4sxHSecsie1T9hfH1u/UdxoLC9kIp6NA4P87vPw/2nQ=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=bPykU6S+mmsPg2wWTvFjEvA3MkWcmncT6sFoFrjNWSdIOVJg6vhvWgNl7tEaIJK28
	b0840oFKvYjzpjUo80RVJPVs/kNv6TPYpkjIJkWBnZHy4G0ZsXK2DOhDFAhUXRQkHU
	JtuKzMYGUyUuniTyS1r9ghVSD0oLwzHUkU73dGQg=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12CGb4BY014112
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 12 Mar 2021 10:37:04 -0600
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE100.ent.ti.com
	(10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Fri, 12 Mar 2021 10:37:04 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Fri, 12 Mar 2021 10:37:04 -0600
Received: from [10.250.78.56] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12CGb30Q093599;
	Fri, 12 Mar 2021 10:37:03 -0600
To: "Nagalla, Hari" <hnagalla@ti.com>, "Devshatwar, Nikhil" <nikhil.nd@ti.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
References: <20210310200045.1287-1-nikhil.nd@ti.com>
	<ca820feb23b6466fac63dab322464cb9@ti.com>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
Message-ID: <2568005e-7a7f-a43f-6f55-e6e3793718b1@ti.com>
Date: Fri, 12 Mar 2021 10:37:02 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.8.0
MIME-Version: 1.0
In-Reply-To: <ca820feb23b6466fac63dab322464cb9@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: "Vutla, Lokesh" <lokeshvutla@ti.com>, "Narang,
	Saurabh" <saurabhnarang@ti.com>, "Nori, Sekhar" <nsekhar@ti.com>,
	Kishon Vijay Abraham <kishon@ti.com>
Subject: Re: [dunfell][PATCH v3] packagegroups: tisdk-connectivity: Include TI wlan packages for k3 platforms
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
X-List-Received-Date: Fri, 12 Mar 2021 16:36:49 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 3/12/2021 8:12 AM, Nagalla, Hari wrote:
> I believe, you could do the same for 'BT_TI' components. Add it to the CONNECTIVITY_RDEPENDS variable.
> 
> In the current builds, BT FW is missing.. The above would fix it..

Can you send a seperate patch for BT update in the same way.


> 
> Thanks
> Hari
> 
> -----Original Message-----
> From: Devshatwar, Nikhil
> Sent: Wednesday, March 10, 2021 2:01 PM
> To: meta-arago@arago-project.org; Bajjuri, Praneeth <praneeth@ti.com>
> Cc: Vutla, Lokesh <lokeshvutla@ti.com>; Kishon Vijay Abraham <kishon@ti.com>; Nori, Sekhar <nsekhar@ti.com>; Nagalla, Hari <hnagalla@ti.com>; Narang, Saurabh <saurabhnarang@ti.com>; Devshatwar, Nikhil <nikhil.nd@ti.com>
> Subject: [meta-arago][dunfell][PATCH v3] packagegroups: tisdk-connectivity: Include TI wlan packages for k3 platforms
> 
> Currently, the K3 platforms do not include the TI wlan related packages.
> Add in the tisdk-connectivity packagegroup.
> 
> While at it, combine the packages added in all overrides into CONNECTIVITY_RDEPENDS variable and remove from overrides.
> 
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
> Suggested-by: Hari Nagalla <hnagalla@gmail.com>
> Reviewed-by: Lokesh Vutla <lokeshvutla@ti.com>
> ---
> 
> Notes:
>      changes from v2:
>      * Combine the common package list into CONNECTIVITY_RDEPENDS
>      
>      changes from v1:
>      
>      * Drop the new recipe and simply include the existing packages for wilink
>        This way, all the platforms are using the same recipes and we don't
>        have to maintain any new recipe just for the am64xx-sk
>        The firmare will get picked from the repo
>        git://git.ti.com/wilink8-wlan/wl18xx_fw.git
> 
>   .../packagegroup-arago-tisdk-connectivity.bb    | 17 +++--------------
>   1 file changed, 3 insertions(+), 14 deletions(-)
> 
> diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> index 11109432..8a8189fe 100644
> --- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
> +++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-ti
> +++ sdk-connectivity.bb
> @@ -61,36 +61,25 @@ CONNECTIVITY_RDEPENDS = " \
>       iproute2-devlink \
>       net-snmp \
>       net-snmp-server-snmpd \
> -"
> -
> -CONNECTIVITY_RDEPENDS_append_ti33x = "\
>       ${WLAN_COMMON} \
>       ${WLAN_TI} \
>       ${BT_COMMON} \
> +"
> +
> +CONNECTIVITY_RDEPENDS_append_ti33x = "\
>       ${BT_TI} \
>       ${DEMO_APPS} \
>   "
>   
>   CONNECTIVITY_RDEPENDS_append_ti43x = "\
> -    ${WLAN_COMMON} \
> -    ${WLAN_TI} \
> -    ${BT_COMMON} \
>       ${BT_TI} \
>       ${DEMO_APPS} \
>   "
>   
>   CONNECTIVITY_RDEPENDS_append_dra7xx = "\
> -    ${WLAN_COMMON} \
> -    ${WLAN_TI} \
> -    ${BT_COMMON} \
>       ${BT_TI} \
>   "
>   
> -CONNECTIVITY_RDEPENDS_append_k3 = "\
> -    ${WLAN_COMMON} \
> -    ${BT_COMMON} \
> -"
> -
>   RDEPENDS_${PN} = "\
>       ${CONNECTIVITY_RDEPENDS} \
>   "
> --
> 2.17.1
> 

