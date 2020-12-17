Return-Path: <praneeth@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id E0B8E529F2
	for <meta-arago@arago-project.org>;
	Thu, 17 Dec 2020 23:31:32 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 0BHNVPsb030519;
	Thu, 17 Dec 2020 17:31:25 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1608247885;
	bh=cXhUNj+FvDF9i4x9+VdQrXksHecn4hIbJ6NhmqWkzVU=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=JANZPe3+FN74jpSXi/YTwhZ8/kydL+NeI0yMSlGnR/xs7ZqqIKkvIU+htLFirTpiS
	QseyoXq1fvb6j1SWCBTMmxuQlo2uSUL5pN8fOWWX7D7UFNwsTBlEkSZ0+2zbaU20Dk
	2WUAykbCUmkLbAJzG51m4HwHvwjMDfucrMl1Tj48=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 0BHNVPLp020817
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 17 Dec 2020 17:31:25 -0600
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3;
	Thu, 17 Dec 2020 17:31:24 -0600
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE107.ent.ti.com
	(157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
	Frontend Transport; Thu, 17 Dec 2020 17:31:24 -0600
Received: from [10.250.50.222] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 0BHNVOV6002022;
	Thu, 17 Dec 2020 17:31:24 -0600
To: Denys Dmytriyenko <denis@denix.org>, <meta-arago@arago-project.org>
References: <1608241346-15755-1-git-send-email-denis@denix.org>
From: "Bajjuri, Praneeth" <praneeth@ti.com>
Message-ID: <814f721d-cc9c-a1c9-b88a-dcc08fa54a7d@ti.com>
Date: Thu, 17 Dec 2020 17:31:23 -0600
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
	Thunderbird/78.5.1
MIME-Version: 1.0
In-Reply-To: <1608241346-15755-1-git-send-email-denis@denix.org>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [dunfell/master][PATCH] optee-os: as meta-ti now has upstream 3.11, drop local fork
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
X-List-Received-Date: Thu, 17 Dec 2020 23:31:34 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit



On 12/17/2020 3:42 PM, Denys Dmytriyenko wrote:
> There's no need for ti-optee-os fork any more, as it's exactly the same as upstream

Thanks Denys for the fix.

This along with the meta-ti patch helped in building 3.11 on sdk builds.

One question though, While there is no difference today between TI and 
upstream optee, Any reason why we cannot use the forked project?
Similar to how we are doing with ATF today ?

> 
> Signed-off-by: Denys Dmytriyenko <denis@denix.org>
> ---
>   meta-arago-distro/recipes-security/optee/optee-os_git.bbappend | 7 -------
>   1 file changed, 7 deletions(-)
>   delete mode 100644 meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> 
> diff --git a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend b/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> deleted file mode 100644
> index 677c6dd..0000000
> --- a/meta-arago-distro/recipes-security/optee/optee-os_git.bbappend
> +++ /dev/null
> @@ -1,7 +0,0 @@
> -PR_append = ".arago0"
> -
> -SRC_URI = "git://git.ti.com/optee/ti-optee-os.git;branch=${BRANCH} \
> -           file://0001-allow-setting-sysroot-for-libgcc-lookup.patch \
> -"
> -BRANCH = "ti-optee-os"
> -SRCREV = "199fca17b575d4c748c9c435e908a6ec9618c75a"
> 

