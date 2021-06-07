Return-Path: <priya.ns@mistralsolutions.com>
Received: from egress-ip33a.ess.de.barracuda.com
	(egress-ip33a.ess.de.barracuda.com [18.185.115.192])
	by arago-project.org (Postfix) with ESMTPS id D444C52B72
	for <meta-arago@arago-project.org>;
	Mon,  7 Jun 2021 10:38:47 +0000 (UTC)
Received: from mail-pf1-f197.google.com (mail-pf1-f197.google.com
	[209.85.210.197]) by
	mx-outbound9-57.eu-central-1a.ess.aws.cudaops.com
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Mon, 07 Jun 2021 10:39:27 +0000
Received: by mail-pf1-f197.google.com with SMTP id
	k22-20020aa788d60000b02902ec984951ffso2779450pff.11
	for <meta-arago@arago-project.org>;
	Mon, 07 Jun 2021 03:39:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mistralsolutions.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ql51eOZhzBGFemfTdrQPC+Loni0QvW8LVf9T4jFLxSw=;
	b=Pu8+VEbbXbpPZbS7uRAmjIyBRAihAQW5En3yXxkXaDJ5PhxiD1HTBYS1R1pB20JEap
	6bp430qp139FBmgBQQQKOCcxr2rGUGBeCfTTaNB2PrIiFnTT3F99Ucwlt1sdoLnZ9ugx
	sA5lqVXABZC+9q8C/a6l4H/fyEFQ6/63VygMc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ql51eOZhzBGFemfTdrQPC+Loni0QvW8LVf9T4jFLxSw=;
	b=mXnyhagZD5fI5p/NDkwcG1NypEHarzBuZxT0xkvXjnBJ5Ib+elG6CdHA4Oq081tohe
	/e/bqcRmPxAAPimuC0qM+0dWCteD03tRDsuTv1xiTCO+E3LdmEwDn10RYcDLZO81t2uk
	yu4Cs99lKGxkh0JHNoeG14y6vhhMLq+1fA1sSiP8s84/HkkzkwX0RFQsHknOWPw53oBN
	hBw9po4Oupt8eFXC3d35Dt3XazPgeCLTGnQ3Hxt3x8x2rD4tZTbQtfGce2A3d6D1RfZh
	H/oaw+w5qHhVdUf030ofUCKLjnAiHh+Yq0YWD+r7o+xx/2vUHiPTEvzO6fJyZVM+1aJa
	HL/Q==
X-Gm-Message-State: AOAM530jsRmf0nl5fzB0uu+FXcmSbAAV8RtHeDzXE55e+v+5WNQrzgqQ
	2OIk43Ba8dJRLd9scDUStiPjuQtO1nQ3Bd6CT3X/vBAanVuCNc7SapB4154EcdotXCX08tZOceI
	opQ/fFd/L8PsWxhsPUEK+kBBgSmZGe1FFfjLVpEZ3p2AVFsNpJgZ58JhkEur9
X-Received: by 2002:a17:902:b590:b029:10f:97b1:62f with SMTP id
	a16-20020a170902b590b029010f97b1062fmr14765820pls.72.1623062365953;
	Mon, 07 Jun 2021 03:39:25 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwp5k0ZWUct6+G00KGjHpvxTvdwrTifnv+JCAoCa399tziuvBGkHUdOYp5Y8JP6mQOdHfDgzQ==
X-Received: by 2002:a17:902:b590:b029:10f:97b1:62f with SMTP id
	a16-20020a170902b590b029010f97b1062fmr14765793pls.72.1623062365742;
	Mon, 07 Jun 2021 03:39:25 -0700 (PDT)
Received: from LAP000507.mistral.in ([106.51.227.150])
	by smtp.gmail.com with ESMTPSA id l8sm8508706pgq.49.2021.06.07.03.39.23
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Mon, 07 Jun 2021 03:39:25 -0700 (PDT)
From: Priya N S <priya.ns@mistralsolutions.com>
To: meta-arago@arago-project.org
Date: Mon,  7 Jun 2021 16:05:37 +0530
Message-Id: <20210607103539.72720-2-priya.ns@mistralsolutions.com>
X-Mailer: git-send-email 2.19.1.windows.1
In-Reply-To: <20210607103539.72720-1-priya.ns@mistralsolutions.com>
References: <20210607103539.72720-1-priya.ns@mistralsolutions.com>
MIME-Version: 1.0
X-BESS-ID: 1623062366-302361-5415-463-1
X-BESS-VER: 2019.1_20210603.1645
X-BESS-Apparent-Source-IP: 209.85.210.197
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2,
	rules version 3.2.2.232773 [from 
	cloudscan11-195.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of
	KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Cc: M V Pratap Reddy <pratap@ti.com>, Sekhar Nori <nsekhar@ti.com>,
	Priya N S <priya.ns@ti.com>
Subject: [master PATCH 1/3] create-sdcard.sh: fix regex used for rootfs tarball
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
X-List-Received-Date: Mon, 07 Jun 2021 10:38:51 -0000
Content-Transfer-Encoding: 8bit

From: Priya N S <priya.ns@ti.com>

From: Priya N S <priya.ns@ti.com>

Filesystem tarballs present in SDK are in the format
tisdk-<IMAGE_TYPE>-image-<MACHINE>.tar.xz. This is different from
earlier format where 'rootfs' was present in all the filesystem
tarball names. Update regex used for filesystem tarball search to
use "image" as the keyword.

Signed-off-by: Priya N S <priya.ns@ti.com>
Signed-off-by: Sekhar Nori <nsekhar@ti.com>
---
 create-sdcard.sh | 9 ++++-----
 1 file changed, 4 insertions(+), 5 deletions(-)

diff --git a/create-sdcard.sh b/create-sdcard.sh
index 736cd42..264095a 100644
--- a/create-sdcard.sh
+++ b/create-sdcard.sh
@@ -752,10 +752,9 @@ if [ $FILEPATHOPTION -eq 1 ] ; then
 	BOOTUENV=`ls $BOOTFILEPATH | grep uEnv.txt | awk {'print $1'}`
 	#rootfs
 	ROOTFILEPARTH="$PARSEPATH/filesystem"
-	#ROOTFSTAR=`ls  $ROOTFILEPARTH | grep tisdk.*rootfs | awk {'print $1'}`
 
 	#Make sure there is only 1 tar
-	CHECKNUMOFTAR=`ls $ROOTFILEPARTH | grep "tisdk.*rootfs" | grep 'tar.xz' | grep -n '' | grep '2:' | awk {'print $1'}`
+	CHECKNUMOFTAR=`ls $ROOTFILEPARTH | grep "tisdk.*image" | grep 'tar.xz' | grep -n '' | grep '2:' | awk {'print $1'}`
 	if [ -n "$CHECKNUMOFTAR" ]
 	then
 cat << EOM
@@ -767,15 +766,15 @@ cat << EOM
 ################################################################################
 
 EOM
-		ls --sort=size $ROOTFILEPARTH | grep "tisdk.*rootfs" | grep 'tar.xz' | grep -n '' | awk {'print "	" , $1'}
+		ls --sort=size $ROOTFILEPARTH | grep "tisdk.*image" | grep 'tar.xz' | grep -n '' | awk {'print "	" , $1'}
 		echo ""
 		read -p "Enter Number of rootfs Tarball: " TARNUMBER
 		echo " "
-		FOUNDTARFILENAME=`ls --sort=size $ROOTFILEPARTH | grep "rootfs" | grep 'tar.xz' | grep -n '' | grep "${TARNUMBER}:" | cut -c3- | awk {'print$1'}`
+		FOUNDTARFILENAME=`ls --sort=size $ROOTFILEPARTH | grep "image" | grep 'tar.xz' | grep -n '' | grep "${TARNUMBER}:" | cut -c3- | awk {'print$1'}`
 		ROOTFSTAR=$FOUNDTARFILENAME
 
 	else
-		ROOTFSTAR=`ls  $ROOTFILEPARTH | grep "tisdk.*rootfs" | grep 'tar.xz' | awk {'print $1'}`
+		ROOTFSTAR=`ls  $ROOTFILEPARTH | grep "tisdk.*image" | grep 'tar.xz' | awk {'print $1'}`
 	fi
 
 	ROOTFSUSERFILEPATH=$ROOTFILEPARTH/$ROOTFSTAR
-- 
2.19.1.windows.1


