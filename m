Return-Path: <dmurphy@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id E1C7152999
	for <meta-arago@arago-project.org>;
	Sat, 24 Oct 2020 21:39:39 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09OLaYPt099839
	for <meta-arago@arago-project.org>; Sat, 24 Oct 2020 16:36:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603575394;
	bh=g1gifB4stlnjjmhUIzMz7rlInM2fpBLyFFN91MASln8=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=t/lVHMbTBBXshaGIGaTKy+RHZjUeETcSi9W+xTXV/YfKcDOIqde3bgEz2lIYhotvd
	dEhuEdgJCaHLHS6QaqpJxvIoH/KsWCNlHy4KRinHck58agSjB73fiLzIoBrSODQoKj
	Jb33sS2d0uiyzG+2wZF9QQ4SWpJZtQvwPwwji2/g=
Received: from DLEE114.ent.ti.com (dlee114.ent.ti.com [157.170.170.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09OLaY3p079616
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Sat, 24 Oct 2020 16:36:34 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE114.ent.ti.com
	(157.170.170.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Sat, 24 Oct 2020 16:36:34 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE101.ent.ti.com
	(157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Sat, 24 Oct 2020 16:36:34 -0500
Received: from [10.250.39.65] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09OLaXMq106099;
	Sat, 24 Oct 2020 16:36:33 -0500
To: Aparna Balasubramanian <aparnab@ti.com>, <meta-arago@arago-project.org>,
	<denys@ti.com>
References: <20201023211141.19571-1-aparnab@ti.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <ca797022-fbf4-9526-0d1a-415cd28c4cb7@ti.com>
Date: Sat, 24 Oct 2020 16:36:33 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201023211141.19571-1-aparnab@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [PATCH] ltp-ddt: Update to latest
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
X-List-Received-Date: Sat, 24 Oct 2020 21:39:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Aparna

On 10/23/20 4:11 PM, Aparna Balasubramanian wrote:
> Signed-off-by: Aparna Balasubramanian <aparnab@ti.com>
> ---
>   meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
> index fb0382da..bcc8f958 100644
> --- a/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
> +++ b/meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt_20200120.bb
> @@ -14,7 +14,7 @@ PE = "1"
>   PR = "r6"

Generally when you update the SHA you should update the PR version

I will fix it up

Dan



