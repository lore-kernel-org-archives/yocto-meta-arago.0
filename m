Return-Path: <dmurphy@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id B4369529D0
	for <meta-arago@arago-project.org>;
	Thu, 10 Dec 2020 22:33:41 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BAMXZsf012718
	for <meta-arago@arago-project.org>; Thu, 10 Dec 2020 16:33:35 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1607639615;
	bh=/4soIO1819zSLWHD8fphlx2ATQwIZeV0VLo6h5QShVw=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=UjAL2uWqObjTKFs1pvsUOd39qNNHVtl+OYeFEDkxxPdIcjm8Nbvx9hxH9kU4Bax9D
	UQb0UgUvWNUy3AFAVoZxrYoMSF15NhdC/ZbytfpUEasqybpf/xZJZpHRawbEJymd7k
	YJvJR9FYJeI21bFYgZeNvB7agZU+aH+sHplZ1rjE=
Received: from DLEE111.ent.ti.com (dlee111.ent.ti.com [157.170.170.22])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BAMXZDn053257
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 10 Dec 2020 16:33:35 -0600
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE111.ent.ti.com
	(157.170.170.22) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 10 Dec 2020 16:33:35 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 10 Dec 2020 16:33:35 -0600
Received: from [10.250.40.192] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BAMXZKf092798;
	Thu, 10 Dec 2020 16:33:35 -0600
To: <praneeth@ti.com>
References: <20201210223235.12724-1-praneeth@ti.com>
From: Dan Murphy <dmurphy@ti.com>
Message-ID: <d14e4577-9e52-1aed-fd9b-fdee636c2625@ti.com>
Date: Thu, 10 Dec 2020 16:33:34 -0600
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
	Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201210223235.12724-1-praneeth@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org
Subject: Re: [dunfell/master PATCH] optee-os: update SRCREV to pick latest
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
X-List-Received-Date: Thu, 10 Dec 2020 22:33:41 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Praneeth

On 12/10/20 4:32 PM, praneeth@ti.com wrote:
> From: Praneeth Bajjuri <praneeth@ti.com>
>
> updating SRCREV to pick the latest commit on
> repo: ti-optee-os.git
> branch: ti-optee-os
>
> Signed-off-by: Praneeth Bajjuri <praneeth@ti.com>
> ---
>   .../recipes-security/optee/optee-os_git.bbappend            | 6 ++++--
>   1 file changed, 4 insertions(+), 2 deletions(-)
>
> diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> index 677c6dd0..28b9b6c5 100644
> --- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> +++ b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> @@ -1,7 +1,9 @@
>   PR_append = ".arago0"
>   
>   SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
> -           file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
> +	   file://0006-allow-setting-sysroot-for-libgcc-lookup.patch \

Why is this 0006? What are the other 5 patches?

Dan


