Return-Path: <nm@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id 8513152AC6
	for <meta-arago@arago-project.org>;
	Wed,  7 Jul 2021 15:08:42 +0000 (UTC)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 167F8lLx053738;
	Wed, 7 Jul 2021 10:08:47 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1625670527;
	bh=UuLWNVENjED3AENk/t07P0Z59WTtP/syeqV9sPVsqKc=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Z88G7C8Yv4ZIDsd+m1PrsFOf2B9cxyiWd2ax1RskbsTMHbFVnL63hR6rU+bLAnVio
	FvCEv23jE1SW9VBRu/05is1ZGtACnp4KIO/AcuTTAmGQYHR1sUXL84F90M4YhJDdzf
	iZ+C4IYjgVtq/OB8PfoP0pfDlgn7PVkOssyk2Ih4=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 167F8l7T114621
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 Jul 2021 10:08:47 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Wed, 7 Jul 2021 10:08:47 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE109.ent.ti.com
	(10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Wed, 7 Jul 2021 10:08:46 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 167F8kB8072042;
	Wed, 7 Jul 2021 10:08:47 -0500
Date: Wed, 7 Jul 2021 10:08:46 -0500
From: Nishanth Menon <nm@ti.com>
To: Priya N S <priya.ns@mistralsolutions.com>
Message-ID: <20210707150846.xbig63m3xffymcnq@overcast>
References: <20210707031414.46720-1-priya.ns@ti.com>
	<20210707031414.46720-4-priya.ns@ti.com>
MIME-Version: 1.0
In-Reply-To: <20210707031414.46720-4-priya.ns@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, Priya N S <priya.ns@ti.com>,
	Sekhar Nori <nsekhar@ti.com>
Subject: Re: [tisdk-setup-scripts] [master] [PATCH-V3 3/3] create-sdcard.sh: Stop using cylinder as unit for partition size
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
X-List-Received-Date: Wed, 07 Jul 2021 15:08:42 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 08:44-20210707, Priya N S wrote:
> From: Priya N S <priya.ns@ti.com>
> 
> * Cylinder size of sdcard is manufacturer dependent. To standardize
>   sdcard partitioning remove the use of cylinder (cyl) unit.
> * While at it shift to using fdisk for the partitioning the sdcard.
>   fdisk is already used in the script and this reduces the dependencies
>   of this script on available installed applications.
> * This fixes cases where already partitioned cards were being detected
>   as not partitioned because of size check elsewhere in the script
>   failing.
> 
> Signed-off-by: Priya N S <priya.ns@ti.com>
> Signed-off-by: Sekhar Nori <nsekhar@ti.com>
> ---
>  create-sdcard.sh | 50 +++++++++++++++++++++++++++++++++++++++---------
>  1 file changed, 41 insertions(+), 9 deletions(-)
> 
> diff --git a/create-sdcard.sh b/create-sdcard.sh
> index d052312..546588b 100644
> --- a/create-sdcard.sh
> +++ b/create-sdcard.sh
> @@ -501,11 +501,29 @@ SIZE=`fdisk -l $DRIVE | grep Disk | awk '{print $5}'`
>  
>  echo DISK SIZE - $SIZE bytes
>  
> -parted -s $DRIVE mklabel msdos
> -parted -s $DRIVE unit cyl mkpart primary fat32 -- 0 9
> -parted -s $DRIVE set 1 boot on
> -parted -s $DRIVE unit cyl mkpart primary ext2 -- 9 310
> -parted -s $DRIVE unit cyl mkpart primary ext2 -- 310 -2
> +cat << END | fdisk $DRIVE
> +n
> +p
> +1
> +
> ++75M

https://lists.yoctoproject.org/g/meta-ti/topic/83851299#13855
Should we make boot partition 128MB as default to make sure it is in
sync with wic image sizes?

> +n
> +p
> +2
> +
> ++2.4G
> +n
> +p
> +3
> +
> +
> +t
> +1
> +c
> +a
> +1
> +w
> +END
>  
>  
>  cat << EOM
> @@ -559,10 +577,24 @@ SIZE=`fdisk -l $DRIVE | grep Disk | awk '{print $5}'`
>  
>  echo DISK SIZE - $SIZE bytes
>  
> -parted -s $DRIVE mklabel msdos
> -parted -s $DRIVE unit cyl mkpart primary fat32 -- 0 9
> -parted -s $DRIVE set 1 boot on
> -parted -s $DRIVE unit cyl mkpart primary ext2 -- 9 -2
> +cat << END | fdisk $DRIVE
> +n
> +p
> +1
> +
> ++75M
same ^^ ?

> +n
> +p
> +2
> +
> +
> +t
> +1
> +c
> +a
> +1
> +w
> +END
>  
>  cat << EOM
>  
> -- 
> 2.19.1.windows.1
> 
> _______________________________________________
> meta-arago mailing list
> meta-arago@arago-project.org
> http://arago-project.org/cgi-bin/mailman/listinfo/meta-arago

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D)/Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

