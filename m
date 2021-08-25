Return-Path: <yogeshs@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 2CA24529E3
	for <meta-arago@arago-project.org>;
	Wed, 25 Aug 2021 11:37:00 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17PBbOFl101196;
	Wed, 25 Aug 2021 06:37:24 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1629891444;
	bh=bh6PPqiUnAI1bwR1e7czKy/dfG/p3QTRCC/YiHiibW0=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=fqLZ+3Gj1SsQZfrIaohehqDJJhx7CP673cHOrGgB9ThDASKBKMy85PDfewWsT5+HU
	RyFtmsv882UoecRShG3FkdovQiCRi3Y1wpzO8Ln+/0LMekJLkUH/JYkigJ3r+pegVh
	Vh0kt87XscAjVgUKX28lnzKLCbzK24k7rjzmao88=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17PBbOsx128851
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 25 Aug 2021 06:37:24 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Wed, 25 Aug 2021 06:37:24 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
	(10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Wed, 25 Aug 2021 06:37:24 -0500
Received: from [10.250.39.223] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17PBbOcu058247;
	Wed, 25 Aug 2021 06:37:24 -0500
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@arago-project.org>
References: <1629833224-27240-1-git-send-email-denis@denix.org>
From: "Siraswar, Yogesh" <yogeshs@ti.com>
Message-ID: <6d86176b-d4f5-4c6b-1df3-ac882fb28886@ti.com>
Date: Wed, 25 Aug 2021 06:37:24 -0500
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <1629833224-27240-1-git-send-email-denis@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Denys Dmytriyenko <denys@konsulko.com>
Subject: Re: [dunfell/master][PATCH] mbedtls: remove bbappend, change is upstream
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
X-List-Received-Date: Wed, 25 Aug 2021 11:37:00 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Denys,
Commit message is empty, please provide some details.

Thanks
Yogesh

On 8/24/2021 2:27 PM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@konsulko.com>
> 
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
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

