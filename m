Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id B1F3C52A00
	for <meta-arago@arago-project.org>;
	Wed, 12 Jun 2019 11:32:29 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5CBVoX6012761
	for <meta-arago@arago-project.org>; Wed, 12 Jun 2019 06:31:50 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1560339110;
	bh=wb3iTfCj8B1wY6DVTGk3KKFBTyd/ijWkhI8sxnHxb+s=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=t8TS6ENA0QEHujK6NI57W+K2Q1N9vrlIbx10GGTKAMwrG0zTLZolJNHrQ+pLLB3HD
	hHPtXViI1kcS0htPfv8k7eG/j5qwrWGLnvprLYDSnRCO+9C/iHwQBh/e9g8Ic3NZCl
	X8QualH6kXfDTMEVZ/mW2mzKLDNVBV0X9RpQXQfM=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5CBVoPX108076
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 12 Jun 2019 06:31:50 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE115.ent.ti.com
	(157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 12 Jun 2019 06:31:50 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
	(157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 12 Jun 2019 06:31:50 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5CBVnHd102846;
	Wed, 12 Jun 2019 06:31:49 -0500
To: Hongmei Gou <h-gou@ti.com>, <meta-arago@arago-project.org>
References: <20190611215940.26526-1-h-gou@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <bb8ccc65-1809-b37d-9814-97244b1d43a3@ti.com>
Date: Wed, 12 Jun 2019 07:31:48 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190611215940.26526-1-h-gou@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [master/thud/ti2019.01] [PATCH] pdm-anomaly-detection: bump SRCREV
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
X-List-Received-Date: Wed, 12 Jun 2019 11:32:30 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Can you please backport this to the ti2019.01 branch?


Thank you,

Jake

On 6/11/2019 5:59 PM, Hongmei Gou wrote:
> * Remove the hardcoding on using a single LSTM layer
> * Add console printfs for anomaly detection status and results
>
> Signed-off-by: Hongmei Gou <h-gou@ti.com>
> ---
>   .../pdm-anomaly-detection/pdm-anomaly-detection_git.bb        | 4 ++--
>   1 file changed, 2 insertions(+), 2 deletions(-)
>
> diff --git a/meta-arago-extras/recipes-apps/pdm-anomaly-detection/pdm-anomaly-detection_git.bb b/meta-arago-extras/recipes-apps/pdm-anomaly-detection/pdm-anomaly-detection_git.bb
> index 4e7b2bc0..3f07013c 100644
> --- a/meta-arago-extras/recipes-apps/pdm-anomaly-detection/pdm-anomaly-detection_git.bb
> +++ b/meta-arago-extras/recipes-apps/pdm-anomaly-detection/pdm-anomaly-detection_git.bb
> @@ -5,12 +5,12 @@ LIC_FILES_CHKSUM = "file://LICENSE;md5=e88016d2cbc82d0d2efbb0865891e9d6"
>   inherit qt-provider
>   
>   PV = "1.0"
> -PR = "r0"
> +PR = "r1"
>   
>   BRANCH = "master"
>   SRC_URI  = "git://git.ti.com/apps/pdm-anomaly-detection.git;protocol=git;branch=${BRANCH}"
>   
> -SRCREV = "832c4021de19998c7e47e94e1868943c9a145489"
> +SRCREV = "01bca39e69cf2e73e17259a16b2465dde7cce6e9"
>   
>   S = "${WORKDIR}/git"
>   

