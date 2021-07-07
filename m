Return-Path: <priya.ns@mistralsolutions.com>
Received: from egress-ip4a.ess.de.barracuda.com
	(egress-ip4a.ess.de.barracuda.com [18.184.203.227])
	by arago-project.org (Postfix) with ESMTPS id B158E52A72
	for <meta-arago@arago-project.org>;
	Wed,  7 Jul 2021 08:44:31 +0000 (UTC)
Received: from mail-pg1-f199.google.com (mail-pg1-f199.google.com
	[209.85.215.199]) by
	mx-outbound14-245.eu-central-1a.ess.aws.cudaops.com
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Wed, 07 Jul 2021 08:44:35 +0000
Received: by mail-pg1-f199.google.com with SMTP id
	29-20020a63105d0000b029022c245c3492so155061pgq.17
	for <meta-arago@arago-project.org>;
	Wed, 07 Jul 2021 01:44:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mistralsolutions.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=sMPTVxOuaYnHaEWmqCaV25XSvV9FVSby8Pvs44szfo8=;
	b=W6MFkk5MosCTZhjflj34OgMmSUF84Y0UdcDbROBKUM/GzvB0SyrzyM15RpZlxFIMzA
	tMXy2ywGCinsoSRubYTvLJrB8V6T601PptRC7LwXBx4bcKWtmPM4nTc0IK4eOanTMW88
	ReyyaJNXj45rxDlIpvGGpX2sGT10IMRZ/qqg0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=sMPTVxOuaYnHaEWmqCaV25XSvV9FVSby8Pvs44szfo8=;
	b=P99I/g1myaJOvD3UVCZWJ3ZH7FYggptohjcJh+3cSbZDJXawPPFuK3XjJ5qL648x4t
	W+o/rlf/JLHhR0NgKFlarmJZb6ymxFpxcywM0hZ731MrDtpK3/sOdnsDBhTijv34/rox
	0VouoslxX1angnbXc/AGqnmGLjYdxRMFOqT0Cku3apgJbZOQGZor/4iGQRIMsFVwrFHX
	9vtIFI7OR2HPLk0r5gqCRqp3UvcjAQb7qj+h1gTPPXIguD0dTuBdJVCF9bqosopdRGTa
	whrvW5PociJVPMPK2GxX2Wbm1q9sz/ycvnxz4Q6cPLf4LL7qHzGRSL0KavPdtE/H8BgF
	mC5w==
X-Gm-Message-State: AOAM533fOOXPozeLO+DV0Lqa6K4MzXQ0zvo+sXmXr36NddjOZ/Cqwq3y
	laDcYtuSMF58+LigQCzCHSC/6abIpiVcycIW8pmr1M7tsnxIEmkyTQOeZ2iTg7AfTG2+XyX+dXg
	kXZQnqhToQcAK0qeF8U1EVMPQqITmwUjwTMXIhawAU4J7pr8brkEXvc5qtMo8
X-Received: by 2002:a17:90a:d994:: with SMTP id
	d20mr7139681pjv.207.1625647473100; 
	Wed, 07 Jul 2021 01:44:33 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwHKhjHLKags6KdjaPltIMbHw3PBgZyCJaW/MK8ugDNQkWd3z1oICz6fa8oU7ibCXdK3nW2mg==
X-Received: by 2002:a17:90a:d994:: with SMTP id
	d20mr7139667pjv.207.1625647472897; 
	Wed, 07 Jul 2021 01:44:32 -0700 (PDT)
Received: from LAP000507.mistral.in ([157.51.169.79])
	by smtp.gmail.com with ESMTPSA id
	d1sm17126581pju.16.2021.07.07.01.44.30
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Wed, 07 Jul 2021 01:44:32 -0700 (PDT)
From: Priya N S <priya.ns@mistralsolutions.com>
X-Google-Original-From: Priya N S <priya.ns@ti.com>
To: meta-arago@arago-project.org
Date: Wed,  7 Jul 2021 08:44:13 +0530
Message-Id: <20210707031414.46720-3-priya.ns@ti.com>
X-Mailer: git-send-email 2.19.1.windows.1
In-Reply-To: <20210707031414.46720-1-priya.ns@ti.com>
References: <20210707031414.46720-1-priya.ns@ti.com>
MIME-Version: 1.0
X-BESS-ID: 1625647474-303829-21304-14771-1
X-BESS-VER: 2019.1_20210706.2354
X-BESS-Apparent-Source-IP: 209.85.215.199
X-BESS-Outbound-Spam-Score: 1.09
X-BESS-Outbound-Spam-Report: Code version 3.2,
	rules version 3.2.2.233441 [from 
	cloudscan16-193.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	pts rule name              description
	---- ---------------------- --------------------------------
	1.08 DATE_IN_PAST_03_06_2   META:  
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
	0.01 DATE_IN_PAST_03_06 HEADER: Date: is 3 to 6 hours before Received:
	date 
X-BESS-Outbound-Spam-Status: SCORE=1.09 using account:ESS91090 scores of
	KILL_LEVEL=7.0 tests=DATE_IN_PAST_03_06_2, BSF_BESS_OUTBOUND,
	DATE_IN_PAST_03_06
X-BESS-BRTS-Status: 1
Cc: Priya N S <priya.ns@ti.com>, Sekhar Nori <nsekhar@ti.com>
Subject: [tisdk-setup-scripts] [master] [PATCH-V3 2/3] create-sdcard: Fix wrong rootfs tarball selection
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
X-List-Received-Date: Wed, 07 Jul 2021 08:44:32 -0000
Content-Transfer-Encoding: 8bit

From: Priya N S <priya.ns@ti.com>

* Validate user input of rootfs tarball selection.
* This will not allow the user to proceed with wrong rootfs
  tarball selection.

Signed-off-by: Priya N S <priya.ns@ti.com>
Signed-off-by: Sekhar Nori <nsekhar@ti.com>
---
 create-sdcard.sh | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/create-sdcard.sh b/create-sdcard.sh
index 264095a..d052312 100644
--- a/create-sdcard.sh
+++ b/create-sdcard.sh
@@ -766,10 +766,19 @@ cat << EOM
 ################################################################################
 
 EOM
-		ls --sort=size $ROOTFILEPARTH | grep "tisdk.*image" | grep 'tar.xz' | grep -n '' | awk {'print "	" , $1'}
-		echo ""
-		read -p "Enter Number of rootfs Tarball: " TARNUMBER
-		echo " "
+		COUNT=`ls $ROOTFILEPARTH | grep "tisdk.*image" | grep 'tar.xz' | grep -n '' | awk {'print $1'} | wc -l`
+		while :
+		do
+			ls --sort=size $ROOTFILEPARTH | grep "tisdk.*image" | grep 'tar.xz' | grep -n '' | awk {'print "	" , $1'}
+			read -p "Enter Number of rootfs Tarball: " TARNUMBER
+			echo
+			if [ -z "${TARNUMBER//[1-$COUNT]}" ] && [ -n "$TARNUMBER" ] ; then
+				break
+			else
+				echo "Invalid selection: '$TARNUMBER'. Please use values from 1 to $COUNT"
+			fi
+			echo
+		done
 		FOUNDTARFILENAME=`ls --sort=size $ROOTFILEPARTH | grep "image" | grep 'tar.xz' | grep -n '' | grep "${TARNUMBER}:" | cut -c3- | awk {'print$1'}`
 		ROOTFSTAR=$FOUNDTARFILENAME
 
-- 
2.19.1.windows.1


