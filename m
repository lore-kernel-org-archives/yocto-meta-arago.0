Return-Path: <priya.ns@mistralsolutions.com>
Received: from egress-ip33a.ess.de.barracuda.com
	(egress-ip33a.ess.de.barracuda.com [18.185.115.192])
	by arago-project.org (Postfix) with ESMTPS id CDAC652B6E
	for <meta-arago@arago-project.org>;
	Tue, 22 Jun 2021 13:44:50 +0000 (UTC)
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com
	[209.85.216.70]) by
	mx-outbound47-108.eu-central-1c.ess.aws.cudaops.com
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 22 Jun 2021 13:45:36 +0000
Received: by mail-pj1-f70.google.com with SMTP id
	x2-20020a17090ab002b029016e8b858193so2133930pjq.3
	for <meta-arago@arago-project.org>;
	Tue, 22 Jun 2021 06:45:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mistralsolutions.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=ql51eOZhzBGFemfTdrQPC+Loni0QvW8LVf9T4jFLxSw=;
	b=WOiGxOrLfMq1KTHkhRpDoAwujBwGFyK1+MIqJ/1JA6CaZI9mAML2iXu0C+wlMAJS7q
	/9fBhoPygDpgrclCYntMqNjsOCtAeXv9eNFhRPzNazfxcLlenjrnRJHy9Xhrc0KBlLfJ
	EP8auEnUzn9SASoCoWvtkvOdU74oGjL9zLqqY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=ql51eOZhzBGFemfTdrQPC+Loni0QvW8LVf9T4jFLxSw=;
	b=YDW7o4/iqDthUsqHI/5kl40doFbdau8+cqXmjDLnqscqYdG1Rh43MaqNAQGPzRHAd6
	6/iyEgJaxbZ4Z3ErExCvJciRB0TauG0wUSV5DLn128vBbktCGtkX25NCVGqIw6yceBgA
	C/aDs6RS1oH9qMUk9dvCWabeEy5akC1dzLw2Zz8HKuALvT9YewrtH61WbEmwJJmRIbuA
	ifHNPf/XWmbIwqcA4gBe7zp1Of29h/Xsfi6YmmR3L4ZyeP1nNidVb/gEDyMcqLCfe801
	Cb8hVk7hMugph7jC3roS6BffD0nCiUy8C+vvoaHO6eyugVb3st3RA+kHRgtn1Howf78j
	nGvQ==
X-Gm-Message-State: AOAM533stp79GNm5sW6bys5aB9OAGfvFV1icvsP7FW87oiguEi7ar0zb
	ssS/NZnJSAqi82C9ta3dlOFjy0SvJmBKXcNdLOclW4yOC+lcqFDvKehp644FKRnL4hKfJ7K3nDY
	TfdvpKENjDC53WxYGCtKzdw3zZnUMIsru/yqlPgtkQcEr95zzQSuLYE8nq5L7
X-Received: by 2002:a17:90b:2243:: with SMTP id
	hk3mr3579190pjb.216.1624369534912; 
	Tue, 22 Jun 2021 06:45:34 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJz1cm4pfphsBrXRg1kqFJ+GNSydNKsIrgSjE6e+TiP5i5N+YupLjsijRmYgjuJP68YqWIZo3A==
X-Received: by 2002:a17:90b:2243:: with SMTP id
	hk3mr3579159pjb.216.1624369534638; 
	Tue, 22 Jun 2021 06:45:34 -0700 (PDT)
Received: from LAP000507.mistral.in ([157.49.90.247])
	by smtp.gmail.com with ESMTPSA id
	n23sm19132178pff.93.2021.06.22.06.45.32
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Jun 2021 06:45:34 -0700 (PDT)
From: Priya N S <priya.ns@mistralsolutions.com>
To: meta-arago@arago-project.org
Date: Tue, 22 Jun 2021 19:14:58 +0530
Message-Id: <20210622134500.87848-2-priya.ns@mistralsolutions.com>
X-Mailer: git-send-email 2.19.1.windows.1
In-Reply-To: <20210622134500.87848-1-priya.ns@mistralsolutions.com>
References: <20210622134500.87848-1-priya.ns@mistralsolutions.com>
MIME-Version: 1.0
X-BESS-ID: 1624369535-312140-8418-5067-1
X-BESS-VER: 2019.1_20210618.2139
X-BESS-Apparent-Source-IP: 209.85.216.70
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2,
	rules version 3.2.2.233105 [from 
	cloudscan18-103.eu-central-1b.ess.aws.cudaops.com]
	Rule breakdown below
	pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of
	KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Cc: Priya N S <priya.ns@ti.com>, Sekhar Nori <nsekhar@ti.com>
Subject: [tisdk-setup-scripts] [master] [PATCH-V2 1/3] create-sdcard.sh: fix regex used for rootfs tarball
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
X-List-Received-Date: Tue, 22 Jun 2021 13:44:51 -0000
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


