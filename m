Return-Path: <praneeth@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id BF4A3529A0
	for <meta-arago@arago-project.org>;
	Mon, 22 Feb 2021 03:46:00 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 11M3kBhC124927
	for <meta-arago@arago-project.org>; Sun, 21 Feb 2021 21:46:11 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1613965571;
	bh=5BF+5etAkO+P5eFhOxw/ejiTjS+uy/Z9Fhdd9THHvEo=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=NkPGlXA0sijBowUfYcnDhlwEr9Te/G5MSViO1HeISrsv4HI/PII02hhMEo6wgnr9N
	KcIsjbKrvh+41YGOynCwA9JJxHn4QnPfKnljbScaEdpU5vk3WFUXm3NyZLLz6UYaiY
	+SKNoH2TZkeWnWFwfjbXvpTQgc6VWjAj11qYlVaE=
Received: from DFLE111.ent.ti.com (dfle111.ent.ti.com [10.64.6.32])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 11M3kBM3026605
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Sun, 21 Feb 2021 21:46:11 -0600
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE111.ent.ti.com
	(10.64.6.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Sun, 21 Feb 2021 21:46:11 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Sun, 21 Feb 2021 21:46:11 -0600
Received: from [10.250.73.199] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 11M3kBvC010412;
	Sun, 21 Feb 2021 21:46:11 -0600
To: "R, Karthik" <karthik.ramanan@ti.com>, "J, KEERTHY" <j-keerthy@ti.com>,
	"meta-arago@arago-project.org" <meta-arago@arago-project.org>
References: <20210216145652.16871-1-j-keerthy@ti.com>
	<e2097e2cdc5f4cd680247439bf3d7290@ti.com>
From: Praneeth Bajjuri <praneeth@ti.com>
Message-ID: <f32fee49-791c-ebcd-5bbe-f4a23755763b@ti.com>
Date: Sun, 21 Feb 2021 21:46:11 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <e2097e2cdc5f4cd680247439bf3d7290@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [PATCH] meta-arago-extras: recipes-devtools: statcol: Add power monitoring support
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
X-List-Received-Date: Mon, 22 Feb 2021 03:46:01 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 2/21/21 5:01 AM, R, Karthik wrote:
> ACK
> 
> -----Original Message-----
> From: J, KEERTHY
> Sent: Tuesday, 16 February, 2021 8:27 PM
> To: meta-arago@arago-project.org
> Cc: Weaver, Lucas <l-weaver@ti.com>; J, KEERTHY <j-keerthy@ti.com>; R, Karthik <karthik.ramanan@ti.com>; J, KEERTHY <j-keerthy@ti.com>
> Subject: [PATCH] meta-arago-extras: recipes-devtools: statcol: Add power monitoring support

Assuming the patch is for dunfell and master. Please use in subject all 
applicable branches.


> 
> From: Keerthy <a0393675@ti.com>

In future : update the settings to reflect your emailid <same as 
"signed-off" line >

For now. I am going to manually update it while i pull to dunfell and 
master branches

> 
> Add power monitoring support
> 
> Signed-off-by: Keerthy <j-keerthy@ti.com>
> ---
>   meta-arago-extras/recipes-devtools/statcol/statcol.bb | 4 +++-
>   1 file changed, 3 insertions(+), 1 deletion(-)
> 
> diff --git a/meta-arago-extras/recipes-devtools/statcol/statcol.bb b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
> index bb841d08..12e10bcf 100644
> --- a/meta-arago-extras/recipes-devtools/statcol/statcol.bb
> +++ b/meta-arago-extras/recipes-devtools/statcol/statcol.bb
> @@ -5,7 +5,7 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=bb6bc27cd44417c389a180bd62f552a0"
>   
>   PROTOCOL = "git"
>   BRANCH = "master"
> -SRCREV = "6420b4e6d98dc2c6825557d7d6f56ffd52fd230c"
> +SRCREV = "dd0131eadf3633e8f9d06cb390d3c6c1b074d873"
>   SRC_URI = "git://git.ti.com/glsdk/statcol.git;protocol=${PROTOCOL};branch=${BRANCH}"
>   
>   DEPENDS = "ti-rpmsg-char websocketd"
> @@ -18,3 +18,5 @@ EXTRA_OEMAKE += "SYSROOT=${STAGING_DIR_TARGET} CROSS_COMPILE=${TARGET_PREFIX}"
>   do_install() {
>   	DESTDIR=${D} make install
>   }
> +
> +PR_append = "_3"
> 

