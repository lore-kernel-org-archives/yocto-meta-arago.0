Return-Path: <j-stiffler@ti.com>
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
	by arago-project.org (Postfix) with ESMTPS id D6187520DF
	for <meta-arago@arago-project.org>;
	Thu, 12 Sep 2019 17:27:28 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8CHQMn9040876
	for <meta-arago@arago-project.org>; Thu, 12 Sep 2019 12:26:22 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1568309182;
	bh=UVOOOmBSztWMDFv1Ui0l5Zb12u+p4r9P4Sgbh15+OTA=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=q7RuoRWnK+e8Yogm8D3SH//JfikOYt5mo+teFwdGrl+agxC9H7mDepZMbdipScv/T
	KPjX/PPT0CxzIzatG2hzVANQd5UcGkSFasIn1ocJ8Lbd376uTZIKY3mNvFmdzdc8rJ
	dp1PAyBF5JeCcCBKRhcHh1wPGQ+Mz67chMk4AXzo=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8CHQMOk129268
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 12 Sep 2019 12:26:22 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 12 Sep 2019 12:26:22 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 12 Sep 2019 12:26:22 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8CHQLiY129144;
	Thu, 12 Sep 2019 12:26:22 -0500
To: Denys Dmytriyenko <denys@ti.com>, <meta-arago@arago-project.org>
References: <1568302717-46518-1-git-send-email-denys@ti.com>
	<1568302717-46518-26-git-send-email-denys@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <b863f54e-6365-efd1-904a-f643e9c3f3e0@ti.com>
Date: Thu, 12 Sep 2019 13:26:21 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.8.0
MIME-Version: 1.0
In-Reply-To: <1568302717-46518-26-git-send-email-denys@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [master][PATCH 25/32] opencv: require "dsp" machine feature
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
X-List-Received-Date: Thu, 12 Sep 2019 17:27:30 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Is this necessary?

In the 3.1 bbappend we configure with opencl only if dsp is in the 
MACHINE_FEATURES. That way we can still use opencv even if the dsp is 
not a MACHINE_FEATURE.

On 9/12/2019 11:38 AM, Denys Dmytriyenko wrote:
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>   meta-arago-distro/recipes-support/opencv/opencv_%.bbappend | 3 +++
>   1 file changed, 3 insertions(+)
>   create mode 100644 meta-arago-distro/recipes-support/opencv/opencv_%.bbappend
>
> diff --git a/meta-arago-distro/recipes-support/opencv/opencv_%.bbappend b/meta-arago-distro/recipes-support/opencv/opencv_%.bbappend
> new file mode 100644
> index 0000000..bc885a4
> --- /dev/null
> +++ b/meta-arago-distro/recipes-support/opencv/opencv_%.bbappend
> @@ -0,0 +1,3 @@
> +inherit machine_features_check
> +
> +REQUIRED_MACHINE_FEATURES = "dsp"

