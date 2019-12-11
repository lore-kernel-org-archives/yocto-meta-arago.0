Return-Path: <j-stiffler@ti.com>
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by arago-project.org (Postfix) with ESMTPS id 69832529BC
	for <meta-arago@arago-project.org>;
	Wed, 11 Dec 2019 18:06:19 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id xBBI4iar117178
	for <meta-arago@arago-project.org>; Wed, 11 Dec 2019 12:04:44 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1576087484;
	bh=ik7L4OtoLzhA8UTosW0ICirpEoNIgCcn8sHgTC08ldM=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=RW0Nl8gNW1GNhrT7gmNqjZ+079UtFxmb/6hrsrqSCiMdgoOghfPq+2MOmkvkMQJDT
	YvtchlsO6BiAYkVCj24feWwVA3NNpKkQT5iZEwzIHye3Y51fRyv4MoaiTvNgGxppm2
	hNFvL251IZpoUpmNVnYhZ9flwa8Vr8sOWHEMWrF4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id xBBI4iSS065463
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-arago@arago-project.org>; Wed, 11 Dec 2019 12:04:44 -0600
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3;
	Wed, 11 Dec 2019 12:04:44 -0600
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE104.ent.ti.com
	(10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1847.3 via
	Frontend Transport; Wed, 11 Dec 2019 12:04:44 -0600
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id xBBI4hSh073863;
	Wed, 11 Dec 2019 12:04:43 -0600
To: Denys Dmytriyenko <denys@ti.com>, <meta-arago@arago-project.org>
References: <1576003858-13746-1-git-send-email-denys@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <e7e1b5d6-944f-b8ce-b2c0-2cbbfcefde7f@ti.com>
Date: Wed, 11 Dec 2019 13:04:43 -0500
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.1
MIME-Version: 1.0
In-Reply-To: <1576003858-13746-1-git-send-email-denys@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: Andreas Dannenberg <dannenberg@ti.com>
Subject: Re: [EXTERNAL] [tisdk-setup-scripts][PATCH] setup-targetfs-nfs: fix cases when group != username
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
X-List-Received-Date: Wed, 11 Dec 2019 18:06:19 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Pushed to master.


Thank you,

Jake

On 12/10/2019 1:50 PM, Denys Dmytriyenko wrote:
> Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> Suggested-by: Andreas Dannenberg <dannenberg@ti.com>
> ---
>   setup-targetfs-nfs.sh | 7 ++++---
>   1 file changed, 4 insertions(+), 3 deletions(-)
>
> diff --git a/setup-targetfs-nfs.sh b/setup-targetfs-nfs.sh
> index 60817ca..b6f679f 100644
> --- a/setup-targetfs-nfs.sh
> +++ b/setup-targetfs-nfs.sh
> @@ -80,19 +80,20 @@ extract_fs() {
>       done
>   
>       me=`whoami`
> +    my_group=`id -gn $me`
>       sudo mkdir -p $1
>       check_status
>       sudo tar xJf $cwd/../filesystem/$fstar -C $1
>       check_status
> -    sudo chown $me:$me $1
> +    sudo chown $me:$my_group $1
>       check_status
> -    sudo chown -R $me:$me $1/home $1/usr $1/etc $1/lib $1/boot
> +    sudo chown -R $me:$my_group $1/home $1/usr $1/etc $1/lib $1/boot
>       check_status
>   
>       # Opt isn't a standard Linux directory. First make sure it exist.
>       if [ -d $1/opt ];
>       then
> -            sudo chown -R $me:$me $1/opt
> +            sudo chown -R $me:$my_group $1/opt
>               check_status
>       fi
>   

