Return-Path: <priya.ns@mistralsolutions.com>
Received: from egress-ip4a.ess.de.barracuda.com
	(egress-ip4a.ess.de.barracuda.com [18.184.203.227])
	by arago-project.org (Postfix) with ESMTPS id 1FF4352ABF
	for <meta-arago@arago-project.org>;
	Wed,  7 Jul 2021 08:44:27 +0000 (UTC)
Received: from mail-pj1-f69.google.com (mail-pj1-f69.google.com
	[209.85.216.69]) by
	mx-outbound14-245.eu-central-1a.ess.aws.cudaops.com
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 07 Jul 2021 08:44:31 +0000
Received: by mail-pj1-f69.google.com with SMTP id
	q9-20020a17090a0649b029016ffc6b9665so3430522pje.1
	for <meta-arago@arago-project.org>;
	Wed, 07 Jul 2021 01:44:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mistralsolutions.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=iivYrwPsogYAimuGwTzEF1Zmc1GsdhYiUUGB4RGTRDE=;
	b=G+gJZwcan6WC+FPvJ9CRTAoqFwQtTPdhHlf5NHkdXwgqnuato1ilDoZehxhDF9ga7N
	JJg3PRNe4h+cOKFdbNm7Gixqx7tpl1ZN5m1zd06d5O1DuXAK5d1e5zCIM9mkFxCvHawP
	VejaakTSYe2WrmZSHCJYHXX2IPO29WuslEkHc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=iivYrwPsogYAimuGwTzEF1Zmc1GsdhYiUUGB4RGTRDE=;
	b=ZNAKxRMRCzQ9YMiQo1kt/MwYedESEB9XpIXDbh0L1ceDDS2QAmisxGwlRt+knOCcz+
	RcOeJY29YKISyVGsjKfzkEz5FuRp6Aha44C7mL3NbxuylO7kslbBOg78n09gIxichPpK
	DtIzrl0VV5ly8tEqnPFUAoiQDo251HaQdyRjSeHsY7xd5IsULSaA77Fd2z1/iDTC84+N
	EJbCAO5OgV4bVAP+Ry4SMaPEZbzfoz9A0fMf8Doh3vLu6lTOoyGNsmb8NT7WXV1QxqxN
	Rz9iHaEhsFOaQ2OOzDdYKVdrlb6lymo5Bl7yF2WMkippwzx8G7RmqX5vdNcioOCnJYgD
	DB6g==
X-Gm-Message-State: AOAM530d08qszhbCEN6hc+69idzRKLAjNrJ9lAjpp7c8i8SMo1o5plVS
	jvKmIRPgYL7Tp3rPsZoIVR6YVxnf/Pgq2Cc05ucQ0zXr0ASbBK3BHO1jv/5lB5JZkKqywdFN8wT
	JFlB2boyYANNNA+NJVEXwgAolr8nz7iUv1AC0brNk8yn0/V93wuUN7VEOFrZM
X-Received: by 2002:a17:90a:3d47:: with SMTP id
	o7mr5045395pjf.68.1625647470634; 
	Wed, 07 Jul 2021 01:44:30 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJzjHt09M++ij5lPRjas//qQRmYcebJMvvKVZaW/3SzRmILOEx6A2WJ7W39rUDrj189QlE6ECQ==
X-Received: by 2002:a17:90a:3d47:: with SMTP id
	o7mr5045375pjf.68.1625647470335; 
	Wed, 07 Jul 2021 01:44:30 -0700 (PDT)
Received: from LAP000507.mistral.in ([157.51.169.79])
	by smtp.gmail.com with ESMTPSA id
	d1sm17126581pju.16.2021.07.07.01.44.28
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Jul 2021 01:44:30 -0700 (PDT)
From: Priya N S <priya.ns@mistralsolutions.com>
X-Google-Original-From: Priya N S <priya.ns@ti.com>
To: meta-arago@arago-project.org
Date: Wed,  7 Jul 2021 08:44:12 +0530
Message-Id: <20210707031414.46720-2-priya.ns@ti.com>
X-Mailer: git-send-email 2.19.1.windows.1
In-Reply-To: <20210707031414.46720-1-priya.ns@ti.com>
References: <20210707031414.46720-1-priya.ns@ti.com>
MIME-Version: 1.0
X-BESS-ID: 1625647471-303829-21306-14746-1
X-BESS-VER: 2019.1_20210706.2354
X-BESS-Apparent-Source-IP: 209.85.216.69
X-BESS-Outbound-Spam-Score: 1.09
X-BESS-Outbound-Spam-Report: Code version 3.2,
	rules version 3.2.2.233441 [from 
	cloudscan20-223.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	pts rule name              description
	---- ---------------------- --------------------------------
	1.08 DATE_IN_PAST_03_06_2   META:  
	0.01 DATE_IN_PAST_03_06 HEADER: Date: is 3 to 6 hours before Received:
	date 
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=1.09 using account:ESS91090 scores of
	KILL_LEVEL=7.0 tests=DATE_IN_PAST_03_06_2, DATE_IN_PAST_03_06,
	BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Cc: Priya N S <priya.ns@ti.com>, Sekhar Nori <nsekhar@ti.com>
Subject: [tisdk-setup-scripts] [master] [PATCH-V3 1/3] create-sdcard.sh: fix regex used for rootfs tarball
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
X-List-Received-Date: Wed, 07 Jul 2021 08:44:29 -0000
Content-Transfer-Encoding: 8bit

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


