Return-Path: <j-stiffler@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTPS id 2A06F520C0
	for <meta-arago@arago-project.org>;
	Fri, 14 Jun 2019 17:59:18 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5EHwcKo045986
	for <meta-arago@arago-project.org>; Fri, 14 Jun 2019 12:58:38 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560535118;
	bh=1eDpRlYvre7oiP9yfXR2WIwwEjbgl/zpR6QSwKCuj4k=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=VsR+z9EoJJyskt2d+oijsPIc54iohiSs7mHlJs0M0LKgs3LAajam/gjBmAhf/osbj
	I3i17fUbZurgCU5ozK4vcfQQQhDUSw+oUcwzOlvhD9z4Vj5siFeiSRYBkmKeQ1ihae
	7RuQQCCWvjiywrhpp7o+sV+7Y2ErA+AyU77ztTdU=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5EHwc7S059179
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Fri, 14 Jun 2019 12:58:38 -0500
Received: from DFLE112.ent.ti.com (10.64.6.33) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Fri, 14 Jun 2019 12:58:37 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Fri, 14 Jun 2019 12:58:37 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5EHwbp5071857;
	Fri, 14 Jun 2019 12:58:37 -0500
To: Hongmei Gou <h-gou@ti.com>, <meta-arago@arago-project.org>
References: <20190613211619.19196-1-h-gou@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <92bc8e10-eb5b-8fbd-9f62-7d7370fa6b2e@ti.com>
Date: Fri, 14 Jun 2019 13:58:37 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <20190613211619.19196-1-h-gou@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [thud/master/ti2019.01] [PATCH] pdm-anomaly-detection: bump SRCREV
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
X-List-Received-Date: Fri, 14 Jun 2019 17:59:18 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Can you backport this to ti2019.01?


Thank you,

Jake


On 6/13/2019 5:16 PM, Hongmei Gou wrote:
> * Improve on the console logging to avoid largely slowing down the Qt GUI display
>
> Signed-off-by: Hongmei Gou <h-gou@ti.com>
> ---
>   .../pdm-anomaly-detection/pdm-anomaly-detection_git.bb        | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-arago-extras/recipes-apps/pdm-anomaly-detection/pdm-anomaly-detection_git.bb b/meta-arago-extras/recipes-apps/pdm-anomaly-detection/pdm-anomaly-detection_git.bb
> index 3f07013c..266cabd9 100644
> --- a/meta-arago-extras/recipes-apps/pdm-anomaly-detection/pdm-anomaly-detection_git.bb
> +++ b/meta-arago-extras/recipes-apps/pdm-anomaly-detection/pdm-anomaly-detection_git.bb
> @@ -5,12 +5,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e88016d2cbc82d0d2efbb0865891e9d6"
>   inherit qt-provider
>   
>   PV = "1.0"
> -PR = "r1"
> +PR = "r2"
>   
>   BRANCH = "master"
>   SRC_URI  = "git://git.ti.com/apps/pdm-anomaly-detection.git;protocol=git;branch=${BRANCH}"
>   
> -SRCREV = "01bca39e69cf2e73e17259a16b2465dde7cce6e9"
> +SRCREV = "2ccf0e5e5aaac73166d52374650a25652bd6aed2"
>   
>   S = "${WORKDIR}/git"
>   

