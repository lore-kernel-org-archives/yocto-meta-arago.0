Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 0E7A1529AE
	for <meta-arago@arago-project.org>;
	Mon, 23 Jul 2018 19:07:31 +0000 (UTC)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id w6NJ7PW8018466
	for <meta-arago@arago-project.org>; Mon, 23 Jul 2018 14:07:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1532372845;
	bh=YkFiAHHyt35vZH4WZXZRtC06z5gF+MXf1cj+Tsuyz/s=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=CJsDh9y7Pe6aYApGUcIGnkwbNvxmLBbvIGJaUr1pkI0BdaGbQniA9NPPvWCw8Q5km
	7WKFkTFTVtww+cvbhPKgURr8IS7StjIN4P48O4Y08u2qSZbgjFBhdPoE6Gsv+loUkl
	BwCrIJxcroKHIGOY+OxmSXIkLY05RbA3Xr4ESn4g=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6NJ7PmQ017078
	for <meta-arago@arago-project.org>; Mon, 23 Jul 2018 14:07:25 -0500
Received: from DFLE110.ent.ti.com (10.64.6.31) by DFLE102.ent.ti.com
	(10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3;
	Mon, 23 Jul 2018 14:07:24 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend
	Transport; Mon, 23 Jul 2018 14:07:24 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w6NJ7OQR002582;
	Mon, 23 Jul 2018 14:07:24 -0500
To: Djordje Senicic <x0157990@ti.com>, <meta-arago@arago-project.org>
References: <1532371124-500-1-git-send-email-x0157990@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <6889765c-3e3b-c259-394e-35dcdabe9368@ti.com>
Date: Mon, 23 Jul 2018 15:07:24 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.9.0
MIME-Version: 1.0
In-Reply-To: <1532371124-500-1-git-send-email-x0157990@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com
Subject: Re: [EXTERNAL] [meta-processor-sdk][PATCH] tidl-utils: Add tidl-utils to devkit
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
X-List-Received-Date: Mon, 23 Jul 2018 19:07:32 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

nativesdk-tidl-utils does not build.


ERROR: Nothing RPROVIDES 'nativesdk-tidl-api' (but 
virtual:nativesdk:/media/hdd1/jake/oe/tisdk-rocko/sources/meta-arago/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb 
RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'nativesdk-tidl-api' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['nativesdk-tidl-api']
ERROR: Required build target 'nativesdk-tidl-utils' has no buildable 
providers.
Missing or unbuildable dependency chain was: ['nativesdk-tidl-utils', 
'nativesdk-tidl-api']
ERROR: Nothing RPROVIDES 'nativesdk-tidl-api' (but 
virtual:nativesdk:/media/hdd1/jake/oe/tisdk-rocko/sources/meta-arago/meta-arago-extras/recipes-ti/tidl-utils/tidl-utils.bb 
RDEPENDS on or otherwise requires it)
NOTE: Runtime target 'nativesdk-tidl-api' is unbuildable, removing...
Missing or unbuildable dependency chain was: ['nativesdk-tidl-api']
ERROR: Required build target 'nativesdk-tidl-utils' has no buildable 
providers.
Missing or unbuildable dependency chain was: ['nativesdk-tidl-utils', 
'nativesdk-tidl-api']


On 7/23/2018 2:38 PM, Djordje Senicic wrote:
> * Include tidl-utils package along with tidl-viewer into devkit
>
> Signed-off-by: Djordje Senicic <x0157990@ti.com>
> ---
>   .../packagegroups/nativesdk-packagegroup-arago-sdk-host.bbappend      | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bbappend b/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bbappend
> index 514d125..b0fafee 100644
> --- a/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bbappend
> +++ b/recipes-core/packagegroups/nativesdk-packagegroup-arago-sdk-host.bbappend
> @@ -1,3 +1,3 @@
> -PR_append = ".tisdk0"
> +PR_append = ".tisdk1"
>   
> -EXTRA_TI_TOOLS_append = " nativesdk-tidl-viewer"
> +EXTRA_TI_TOOLS_append = " nativesdk-tidl-viewer nativesdk-tidl-utils "


