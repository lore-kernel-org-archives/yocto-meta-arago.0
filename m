Return-Path: <nm@ti.com>
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by arago-project.org (Postfix) with ESMTP id CE0D552B87
	for <meta-arago@arago-project.org>;
	Wed, 23 Jun 2021 03:19:03 +0000 (UTC)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 15N3J3ri016813;
	Tue, 22 Jun 2021 22:19:03 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1624418343;
	bh=ZribuIq70q+a0iFjiuBhLUjaNTzizhoWJXun8ReuYdU=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=gZ1ZMF+d86/Ym870IzhyhZKat9Qv5BmX59OofWGYhG2oGbH91/MMFgBDdK6vbVlxL
	0Vk6yfIStGi/7z2KiC8OWikfFuurGiERx0V2Ek1YPdv3hyvCMHdwpZsSh+B6c3s0Lr
	QfUlpxdc+dEWzLw1ONbfB7V3F/hGXRjXCs/5rtbw=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 15N3J3Jl054011
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 22 Jun 2021 22:19:03 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE112.ent.ti.com
	(10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2;
	Tue, 22 Jun 2021 22:19:03 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE105.ent.ti.com
	(10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
	Frontend Transport; Tue, 22 Jun 2021 22:19:03 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 15N3J357008128;
	Tue, 22 Jun 2021 22:19:03 -0500
Date: Tue, 22 Jun 2021 22:19:02 -0500
From: Nishanth Menon <nm@ti.com>
To: Priya N S <priya.ns@mistralsolutions.com>
Message-ID: <20210623031902.ngujfnp4iqwv2iz3@turkey>
References: <20210622134500.87848-1-priya.ns@mistralsolutions.com>
	<20210622134500.87848-3-priya.ns@mistralsolutions.com>
MIME-Version: 1.0
In-Reply-To: <20210622134500.87848-3-priya.ns@mistralsolutions.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-arago@arago-project.org, Priya N S <priya.ns@ti.com>,
	Sekhar Nori <nsekhar@ti.com>
Subject: Re: [tisdk-setup-scripts] [master] [PATCH-V2 2/3] create-sdcard: Fix wrong rootfs tarball selection
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
X-List-Received-Date: Wed, 23 Jun 2021 03:19:04 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On 19:14-20210622, Priya N S wrote:
> From: Priya N S <priya.ns@ti.com>
> 
> From: Priya N S <priya.ns@ti.com>
> 
> * Validate user input of rootfs tarball selection.
> * This will not allow the user to proceed with wrong rootfs
>   tarball selection.
> 
> Signed-off-by: Priya N S <priya.ns@ti.com>
> Signed-off-by: Sekhar Nori <nsekhar@ti.com>
> ---
>  create-sdcard.sh | 16 +++++++++++++---
>  1 file changed, 13 insertions(+), 3 deletions(-)
> 
> diff --git a/create-sdcard.sh b/create-sdcard.sh
> index 264095a..8f99687 100644
> --- a/create-sdcard.sh
> +++ b/create-sdcard.sh
> @@ -767,9 +767,19 @@ cat << EOM
>  
>  EOM
>  		ls --sort=size $ROOTFILEPARTH | grep "tisdk.*image" | grep 'tar.xz' | grep -n '' | awk {'print "	" , $1'}

Do you want to move this inside the while loop?

> -		echo ""
> -		read -p "Enter Number of rootfs Tarball: " TARNUMBER
> -		echo " "
> +		COUNT=`ls $ROOTFILEPARTH | grep "tisdk.*image" | grep 'tar.xz' | grep -n '' | awk {'print $1'} | wc -l`
> +		ENTERCORRECTLY="0"
> +		while [ $ENTERCORRECTLY -ne 1 ]
> +		do
> +			read -p "Enter Number of rootfs Tarball: " TARNUMBER
> +			echo " "

just echo?

> +			if [ -z "${TARNUMBER//[0-$COUNT]}" ] && [ -n "$TARNUMBER" ] ; then

if COUNT=2 is '0' a valid entry? While the above might be a smart code,
I wonder if we could simplify for readability?


> +				ENTERCORRECTLY=1
'break' should simplify this loop?
> +			else
> +				echo "Invalid selection!"
Could we articulate this to be "Invalid selection: '$TARNUMBER'. Please use values from 1 to $COUNT"
> +			fi
> +			echo ""
"" is redundant.

I don't think the following is proper - does'nt handle 0 case, but..
maybe?
while :
do
	read -p "Enter Number of rootfs Tarball: " TARNUMBER
	echo
	if [ -z "${TARNUMBER//[0-$COUNT]}" ] && [ -n "$TARNUMBER" ] ; then
		break
	fi
	echo "Invalid selection: '$TARNUMBER'. Please use values from 1 to $COUNT"
done
> +		done
>  		FOUNDTARFILENAME=`ls --sort=size $ROOTFILEPARTH | grep "image" | grep 'tar.xz' | grep -n '' | grep "${TARNUMBER}:" | cut -c3- | awk {'print$1'}`
>  		ROOTFSTAR=$FOUNDTARFILENAME
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
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D

