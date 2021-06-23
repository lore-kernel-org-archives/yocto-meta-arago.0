Return-Path: <nm@ti.com>
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by arago-project.org (Postfix) with ESMTP id 949F752B8F
	for <meta-arago@arago-project.org>;
	Wed, 23 Jun 2021 03:03:43 +0000 (UTC)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15N33hI9094712;
	Tue, 22 Jun 2021 22:03:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1624417423;
	bh=zTnL4R+B2xIp/bJMKr+Qn3SNElBh87B3Cj5bmpHY7lY=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=Gg7cedmALXZOVNWIWd4dz+94fW9w0wPBoH2UK1gw8DiIhWkRi1sU2M4psFOW7MicB
	+KWe5ENMve54GhJ2MrV+VRPbfWqlaOUSYBiOAgX1VY3c69HzzuyqiF3Q+NtIHKz3ZW
	Jxis2SFfYC9uTei+sSqGaq3ZGwQfNFQrdrbV5D9s=
Received: from DFLE114.ent.ti.com (dfle114.ent.ti.com [10.64.6.35])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15N33h7i102472
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Jun 2021 22:03:43 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE114.ent.ti.com
	(10.64.6.35) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Tue, 22 Jun 2021 22:03:43 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Tue, 22 Jun 2021 22:03:43 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15N33gw0032610;
	Tue, 22 Jun 2021 22:03:42 -0500
Date: Tue, 22 Jun 2021 22:03:42 -0500
From: Nishanth Menon <nm@ti.com>
To: Priya N S <priya.ns@mistralsolutions.com>
Message-ID: <20210623030342.gfqtk5onuowbcahp@corporate>
References: <20210622134500.87848-1-priya.ns@mistralsolutions.com>
	<20210622134500.87848-2-priya.ns@mistralsolutions.com>
MIME-Version: 1.0
In-Reply-To: <20210622134500.87848-2-priya.ns@mistralsolutions.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, Priya N S <priya.ns@ti.com>,
	Sekhar Nori <nsekhar@ti.com>
Subject: Re: [tisdk-setup-scripts] [master] [PATCH-V2 1/3] create-sdcard.sh: fix regex used for rootfs tarball
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
X-List-Received-Date: Wed, 23 Jun 2021 03:03:43 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 19:14-20210622, Priya N S wrote:
> From: Priya N S <priya.ns@ti.com>
> 
> From: Priya N S <priya.ns@ti.com>
> 
> Filesystem tarballs present in SDK are in the format
> tisdk-<IMAGE_TYPE>-image-<MACHINE>.tar.xz. This is different from
> earlier format where 'rootfs' was present in all the filesystem
> tarball names. Update regex used for filesystem tarball search to
> use "image" as the keyword.
> 
> Signed-off-by: Priya N S <priya.ns@ti.com>
> Signed-off-by: Sekhar Nori <nsekhar@ti.com>
> ---
>  create-sdcard.sh | 9 ++++-----
>  1 file changed, 4 insertions(+), 5 deletions(-)
> 
> diff --git a/create-sdcard.sh b/create-sdcard.sh
> index 736cd42..264095a 100644
> --- a/create-sdcard.sh
> +++ b/create-sdcard.sh
> @@ -752,10 +752,9 @@ if [ $FILEPATHOPTION -eq 1 ] ; then
>  	BOOTUENV=`ls $BOOTFILEPATH | grep uEnv.txt | awk {'print $1'}`
>  	#rootfs
>  	ROOTFILEPARTH="$PARSEPATH/filesystem"
> -	#ROOTFSTAR=`ls  $ROOTFILEPARTH | grep tisdk.*rootfs | awk {'print $1'}`

Can we drop this? We should'nt have commented out code.

>  
>  	#Make sure there is only 1 tar
> -	CHECKNUMOFTAR=`ls $ROOTFILEPARTH | grep "tisdk.*rootfs" | grep 'tar.xz' | grep -n '' | grep '2:' | awk {'print $1'}`
> +	CHECKNUMOFTAR=`ls $ROOTFILEPARTH | grep "tisdk.*image" | grep 'tar.xz' | grep -n '' | grep '2:' | awk {'print $1'}`
>  	if [ -n "$CHECKNUMOFTAR" ]
>  	then
>  cat << EOM
> @@ -767,15 +766,15 @@ cat << EOM
>  ################################################################################
>  
>  EOM
> -		ls --sort=size $ROOTFILEPARTH | grep "tisdk.*rootfs" | grep 'tar.xz' | grep -n '' | awk {'print "	" , $1'}
> +		ls --sort=size $ROOTFILEPARTH | grep "tisdk.*image" | grep 'tar.xz' | grep -n '' | awk {'print "	" , $1'}
>  		echo ""
>  		read -p "Enter Number of rootfs Tarball: " TARNUMBER
>  		echo " "
> -		FOUNDTARFILENAME=`ls --sort=size $ROOTFILEPARTH | grep "rootfs" | grep 'tar.xz' | grep -n '' | grep "${TARNUMBER}:" | cut -c3- | awk {'print$1'}`
> +		FOUNDTARFILENAME=`ls --sort=size $ROOTFILEPARTH | grep "image" | grep 'tar.xz' | grep -n '' | grep "${TARNUMBER}:" | cut -c3- | awk {'print$1'}`
>  		ROOTFSTAR=$FOUNDTARFILENAME
>  
>  	else
> -		ROOTFSTAR=`ls  $ROOTFILEPARTH | grep "tisdk.*rootfs" | grep 'tar.xz' | awk {'print $1'}`
> +		ROOTFSTAR=`ls  $ROOTFILEPARTH | grep "tisdk.*image" | grep 'tar.xz' | awk {'print $1'}`
>  	fi
>  
>  	ROOTFSUSERFILEPATH=$ROOTFILEPARTH/$ROOTFSTAR
> -- 
> 2.19.1.windows.1

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

