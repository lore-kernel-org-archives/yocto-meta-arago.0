Return-Path: <dmurphy@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTPS id 4D6A3520E5
	for <meta-arago@arago-project.org>;
	Wed,  7 Oct 2020 16:12:40 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 097G9dUx025996;
	Wed, 7 Oct 2020 11:09:39 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1602086979;
	bh=H0UeYXCWJONhcYvZk1CrNmA9QM1eu1KltVU9TGhYmt4=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=gr+V7ihu4G+yMO0YArN68BjNEjm2zrsU7ByUfTQiVr9sVMc3glbiizOsdkc991Z3+
	THVPB52q0NqasGEly4MHIb9olBuN0WlgSbOe15qLgolF5gCby86RGJRcTI4Bd4QawG
	PRI8msdaC1usggkkHhof+bwCvvuQituv3xQqP9f4=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 097G9dqg071116
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Oct 2020 11:09:39 -0500
Received: from DLEE108.ent.ti.com (157.170.170.38) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Wed, 7 Oct 2020 11:09:38 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Wed, 7 Oct 2020 11:09:38 -0500
Received: from [10.250.39.105] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 097G9c4H028351;
	Wed, 7 Oct 2020 11:09:38 -0500
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@arago-project.org>
References: <1602086759-18443-1-git-send-email-denis@denix.org>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <ceffc944-615b-45d2-12ee-300559e4ce35@ti.com>
Date: Wed, 7 Oct 2020 11:09:38 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <1602086759-18443-1-git-send-email-denis@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [dunfell/master][PATCH] arago.conf: change the local feed address
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
X-List-Received-Date: Wed, 07 Oct 2020 16:12:40 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys

On 10/7/20 11:05 AM, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@ti.com>
>
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> ---
>   meta-arago-distro/conf/distro/arago.conf | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/meta-arago-distro/conf/distro/arago.conf b/meta-arago-distro/conf/distro/arago.conf
> index 3e8f5f3..7c70281 100644
> --- a/meta-arago-distro/conf/distro/arago.conf
> +++ b/meta-arago-distro/conf/distro/arago.conf
> @@ -1,7 +1,7 @@
>   # Name and version of the distribution
>   DISTRO_NAME = "Arago"
>   DISTRO_VERSION = "2020.09"
> -DISTRO_FEED_URI ?= "http://lcpd.gt.design.ti.com"
> +DISTRO_FEED_URI ?= "http://lcpd.itg.ti.com"
>   BUILD_VARIANT = "${@['prod','rt','systest'][int(d.getVar('ARAGO_RT_ENABLE'))+int(d.getVar('ARAGO_SYSTEST_ENABLE'))*2]}"
>   TISDK_VERSION ?= "live"
>   FEEDURIPREFIX ?= "packages/${DISTRO}-dunfell/${TISDK_VERSION}/${BUILD_VARIANT}/"

applied to -next

Dan


