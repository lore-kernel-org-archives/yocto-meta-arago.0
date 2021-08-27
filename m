Return-Path: <yogeshs@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id C82F1529A8
	for <meta-arago@arago-project.org>;
	Fri, 27 Aug 2021 19:38:02 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17RJcSwM107522;
	Fri, 27 Aug 2021 14:38:28 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1630093108;
	bh=TqQ7iK+atcv1K9Ir3Cn+J+K6xhDK7Z9x/QXBPRekVZU=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=nkqAasZPFPJU6k2xsNiSfMT1HlwMbL4XXSA6KcLcV4/qvqfnO2H51uzgA8UX+Oa7X
	ltJthECIWE3wGQLFyfIFDj4yZ3Rht10GprZ+SUeVDzcXpp/fqpvyncP1utAXHond4Q
	35JY/ug330OVc4HDn+KmpDdB4cq+kbfDYT2aStec=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17RJcSXV125415
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 27 Aug 2021 14:38:28 -0500
Received: from DLEE103.ent.ti.com (157.170.170.33) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14;
	Fri, 27 Aug 2021 14:38:28 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE103.ent.ti.com
	(157.170.170.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
	Frontend Transport; Fri, 27 Aug 2021 14:38:28 -0500
Received: from [10.250.69.185] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17RJcRkj076488;
	Fri, 27 Aug 2021 14:38:28 -0500
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@arago-project.org>
References: <1629918280-21540-1-git-send-email-denis@denix.org>
From: "Siraswar, Yogesh" <yogeshs@ti.com>
Message-ID: <ef2801d8-4f56-750b-42b5-d30e1d704379@ti.com>
Date: Fri, 27 Aug 2021 14:38:27 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1629918280-21540-1-git-send-email-denis@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [dunfell/master][PATCH v2] mbedtls: remove bbappend
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
X-List-Received-Date: Fri, 27 Aug 2021 19:38:03 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Applied to master and dunfell. Thanks

On 8/25/2021 2:04 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> This change is now upstream.
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
> v2 - expand commit message into 2 lines
> 
>   meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_%.bbappend | 1 -
>   1 file changed, 1 deletion(-)
>   delete mode 100644 meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_%.bbappend
> 
> diff --git a/meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_%.bbappend b/meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_%.bbappend
> deleted file mode 100644
> index 608377e..0000000
> --- a/meta-arago-distro/recipes-connectivity/mbedtls/mbedtls_%.bbappend
> +++ /dev/null
> @@ -1 +0,0 @@
> -BBCLASSEXTEND = "native nativesdk"
> 

