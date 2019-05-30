Return-Path: <j-stiffler@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id A3CC552092
	for <meta-arago@arago-project.org>;
	Thu, 30 May 2019 17:47:10 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x4UHkZkG112378
	for <meta-arago@arago-project.org>; Thu, 30 May 2019 12:46:35 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1559238395;
	bh=+bclbd8hFEVZUAHcRh2HZ67si9D5mK70ccNoAyEiTY8=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=ovgGMrGdwr96j0LOs2ARKGCncqSm3y6G7tkLLgFokF/LLJEi8DfmuL+os6vcwhwA1
	aV5vRQTPiw0WWQxb1OJ/g+C+CkRCq5Q9nvpaIjxoq58FmwrK7ndGY5eqFLdQrvTCFI
	5wWERsQwvw6yZ/suYaz4Zf6uqT5b89bDn9IRWmh4=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x4UHkZEo062107
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 30 May 2019 12:46:35 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 30 May 2019 12:46:34 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 30 May 2019 12:46:34 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x4UHkYbv089479;
	Thu, 30 May 2019 12:46:34 -0500
To: Hongmei Gou <h-gou@ti.com>, <meta-arago@arago-project.org>
References: <20190529211930.817-1-h-gou@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <0d3e453c-6712-9bc7-8e76-ea8c158c3649@ti.com>
Date: Thu, 30 May 2019 13:46:33 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.6.1
MIME-Version: 1.0
In-Reply-To: <20190529211930.817-1-h-gou@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: d-senicic1@ti.com
Subject: Re: [EXTERNAL] [matrix-gui-v2-apps] [PATCH v4] Add analytics_submenu and analytics_pdm_anomaly_detection demo
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
X-List-Received-Date: Thu, 30 May 2019 17:47:11 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

ACK

Thank you!


On 5/29/2019 5:19 PM, Hongmei Gou wrote:
> * A new icon image "analytics-icon.png" is also added
>
> Signed-off-by: Hongmei Gou <h-gou@ti.com>
> ---
> v4 changes:
>   * Rename generic name of /tmp/myfifo to /tmp/pdmfifo
>   * Add more explanations on use of /tmp/pdmfifo
>
>   .../analytics_pdm_anomaly_detection.desktop   |   9 ++++
>   .../desc_analytics_pdm_anomaly_detection.html |  23 +++++++++
>   .../runPdmAnomalyDetection.sh                 |  45 ++++++++++++++++++
>   analytics_submenu/analytics.desktop           |   7 +++
>   images/analytics-icon.png                     | Bin 0 -> 16715 bytes
>   5 files changed, 84 insertions(+)
>   create mode 100644 analytics_apps/analytics_pdm_anomaly_detection/analytics_pdm_anomaly_detection.desktop
>   create mode 100644 analytics_apps/analytics_pdm_anomaly_detection/desc_analytics_pdm_anomaly_detection.html
>   create mode 100644 analytics_apps/analytics_pdm_anomaly_detection/runPdmAnomalyDetection.sh
>   create mode 100644 analytics_submenu/analytics.desktop
>   create mode 100644 images/analytics-icon.png
>

