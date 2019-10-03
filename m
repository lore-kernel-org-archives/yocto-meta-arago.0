Return-Path: <nikhil.nd@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 9921452980
	for <meta-arago@arago-project.org>;
	Thu,  3 Oct 2019 13:36:10 +0000 (UTC)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x93DYwVD037370
	for <meta-arago@arago-project.org>; Thu, 3 Oct 2019 08:34:58 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1570109698;
	bh=VrN/s3wgNs3DtMaspt2nwtk9Pg/vHQw4hXl8k4Wc8A8=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=jo+Y2nB23bDGiYJy8ZQFmBez3EtFbtdguPfuKgG8R4ZrVmoKU9/SeaDK66x3Scu2h
	Ipy6TE+AEJmPuixzIx1wWmy4p3bhHyfjRdsU5WwPm7DxXde1KIrPFeRJ6hH/Jf1o51
	emJd+yAzF+vW01QkBeqAgfX2Yej9zs2V32zYZi6k=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x93DYwge095634
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Thu, 3 Oct 2019 08:34:58 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
	(157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Thu, 3 Oct 2019 08:34:47 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Thu, 3 Oct 2019 08:34:47 -0500
Received: from [172.24.190.110] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id x93DYuRS008634;
	Thu, 3 Oct 2019 08:34:57 -0500
To: Nikhil Devshatwar <nikhil.nd@ti.com>, <meta-arago@arago-project.org>
References: <1569940366-184916-1-git-send-email-nikhil.nd@ti.com>
From: Nikhil Devshatwar <a0132237@ti.com>
Message-ID: <a686ea51-dae2-f6f5-91a1-9daa08dfb41b@ti.com>
Date: Thu, 3 Oct 2019 19:04:56 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.0
MIME-Version: 1.0
In-Reply-To: <1569940366-184916-1-git-send-email-nikhil.nd@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [tisdk-setup-scripts] [PATCH v1] setup-package-install: Add flex and libssl-dev packages
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
X-List-Received-Date: Thu, 03 Oct 2019 13:36:10 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

On 01/10/19 8:02 PM, Nikhil Devshatwar wrote:
> For building kernel binaries, host machine should have flex and
> libssl-dev packages installed.
>
> Add these to list of packages.
>
> Signed-off-by: Nikhil Devshatwar <nikhil.nd@ti.com>
ping

Nikhil D
> ---
>   setup-package-install.sh | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/setup-package-install.sh b/setup-package-install.sh
> index 1e9fedb..922e504 100644
> --- a/setup-package-install.sh
> +++ b/setup-package-install.sh
> @@ -56,7 +56,7 @@ cwd=`dirname $0`
>   
>   entry_header
>   
> -packages_to_install="xinetd tftpd nfs-kernel-server minicom build-essential libncurses5-dev autoconf automake dos2unix screen lrzsz lzop"
> +packages_to_install="xinetd tftpd nfs-kernel-server minicom build-essential libncurses5-dev autoconf automake dos2unix screen lrzsz lzop flex libssl-dev"
>   
>   get_major_host_version host_major_version
>   


