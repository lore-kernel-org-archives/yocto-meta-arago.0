Return-Path: <priya.ns@mistralsolutions.com>
Received: from egress-ip33a.ess.de.barracuda.com
	(egress-ip33a.ess.de.barracuda.com [18.185.115.192])
	by arago-project.org (Postfix) with ESMTPS id 8B72452B6B
	for <meta-arago@arago-project.org>;
	Tue, 22 Jun 2021 13:44:52 +0000 (UTC)
Received: from mail-pl1-f200.google.com (mail-pl1-f200.google.com
	[209.85.214.200]) by
	mx-outbound47-108.eu-central-1c.ess.aws.cudaops.com
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256
	verify=NO); Tue, 22 Jun 2021 13:45:38 +0000
Received: by mail-pl1-f200.google.com with SMTP id
	d1-20020a1709027281b0290112c70b86f1so6317093pll.12
	for <meta-arago@arago-project.org>;
	Tue, 22 Jun 2021 06:45:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=mistralsolutions.com; s=google;
	h=from:to:cc:subject:date:message-id:in-reply-to:references
	:mime-version:content-transfer-encoding;
	bh=xZRXVSElO8Nzqb+EWuAm8Sv1GOqgxAwEt91tK02V2wc=;
	b=PeW5NGa+lDI0HPTdlndB8CAswVC8g5dfMMND0eDSKY2zjMRR3VapJOWxlrb3uXZNSI
	GWF66VOMwYpE1KHz8ceFlfYeGe61DAUc816bnqcLhakV3OKs0Z6UcaEWcG4eta9CeBt7
	iwuS6Dn7IdCksx8bs0kS35r+iapQy2Gjxu0r8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references:mime-version:content-transfer-encoding;
	bh=xZRXVSElO8Nzqb+EWuAm8Sv1GOqgxAwEt91tK02V2wc=;
	b=MtD1oAcWUAi2eMqIFS6gzVtCnUEMPAbW+vB1918RIey5a2hc9XdAf7TMJ1BRUrRxtb
	6N92MX2HsFtfKdSQJjrv55ooL9V/8lSOEWoYXK2/wac3vZAl9R9qOavo3wzhieeCPjK9
	CtUTeQBg5XWN8ib0XtvGp1NGY8C07k8evWx+4KTx1A0fB8EuMMNKnhU/c8CjKarXkjhJ
	SL71yc8EuWGQjgPpTcVO+Cj1BarVQDQf19Ho2ecPgFthCrMSEaIXli1nd90Li6cfDlQu
	hqIxD+9Xhh4ZesGCxnuwdShNynE/cIMNCIFMh1ijQCTXtxuFN61gCOkjXU3Vz9+sJN+F
	JNMw==
X-Gm-Message-State: AOAM533tQAhasYkHptDXaC3jDCCMn/hXnka5sUT7f/PNyindjjQhsvqL
	DGVsn3ZT4jG9QstCB2tasbUwf9GhEMW5eSvTok+haHpIq4jAZCjwQsG6XWVMvtMT+/zV7AaL3y1
	STuBsh+2WVR6RrHZyd70TOAIA54GrSe1TPwKs1bjHWrMXkMdmDGuEXw7DeHPE
X-Received: by 2002:a63:805:: with SMTP id 5mr3837462pgi.353.1624369537127;
	Tue, 22 Jun 2021 06:45:37 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJwCGXhkgOwogiJHLcVPRmVPLFD/871da/Flyo5ELMfDS6oyJBg4EfOpiXSI/xv4+NYjICLe4Q==
X-Received: by 2002:a63:805:: with SMTP id 5mr3837445pgi.353.1624369536825;
	Tue, 22 Jun 2021 06:45:36 -0700 (PDT)
Received: from LAP000507.mistral.in ([157.49.90.247])
	by smtp.gmail.com with ESMTPSA id
	n23sm19132178pff.93.2021.06.22.06.45.34
	(version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
	Tue, 22 Jun 2021 06:45:36 -0700 (PDT)
From: Priya N S <priya.ns@mistralsolutions.com>
To: meta-arago@arago-project.org
Date: Tue, 22 Jun 2021 19:14:59 +0530
Message-Id: <20210622134500.87848-3-priya.ns@mistralsolutions.com>
X-Mailer: git-send-email 2.19.1.windows.1
In-Reply-To: <20210622134500.87848-1-priya.ns@mistralsolutions.com>
References: <20210622134500.87848-1-priya.ns@mistralsolutions.com>
MIME-Version: 1.0
X-BESS-ID: 1624369537-312140-21989-119888-1
X-BESS-VER: 2019.1_20210618.2139
X-BESS-Apparent-Source-IP: 209.85.214.200
X-BESS-Outbound-Spam-Score: 0.00
X-BESS-Outbound-Spam-Report: Code version 3.2,
	rules version 3.2.2.233105 [from 
	cloudscan10-50.eu-central-1a.ess.aws.cudaops.com]
	Rule breakdown below
	pts rule name              description
	---- ---------------------- --------------------------------
	0.00 BSF_BESS_OUTBOUND      META: BESS Outbound 
X-BESS-Outbound-Spam-Status: SCORE=0.00 using account:ESS91090 scores of
	KILL_LEVEL=7.0 tests=BSF_BESS_OUTBOUND
X-BESS-BRTS-Status: 1
Cc: Priya N S <priya.ns@ti.com>, Sekhar Nori <nsekhar@ti.com>
Subject: [tisdk-setup-scripts] [master] [PATCH-V2 2/3] create-sdcard: Fix wrong rootfs tarball selection
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
X-List-Received-Date: Tue, 22 Jun 2021 13:44:53 -0000
Content-Transfer-Encoding: 8bit

From: Priya N S <priya.ns@ti.com>

From: Priya N S <priya.ns@ti.com>

* Validate user input of rootfs tarball selection.
* This will not allow the user to proceed with wrong rootfs
  tarball selection.

Signed-off-by: Priya N S <priya.ns@ti.com>
Signed-off-by: Sekhar Nori <nsekhar@ti.com>
---
 create-sdcard.sh | 16 +++++++++++++---
 1 file changed, 13 insertions(+), 3 deletions(-)

diff --git a/create-sdcard.sh b/create-sdcard.sh
index 264095a..8f99687 100644
--- a/create-sdcard.sh
+++ b/create-sdcard.sh
@@ -767,9 +767,19 @@ cat << EOM
 
 EOM
 		ls --sort=size $ROOTFILEPARTH | grep "tisdk.*image" | grep 'tar.xz' | grep -n '' | awk {'print "	" , $1'}
-		echo ""
-		read -p "Enter Number of rootfs Tarball: " TARNUMBER
-		echo " "
+		COUNT=`ls $ROOTFILEPARTH | grep "tisdk.*image" | grep 'tar.xz' | grep -n '' | awk {'print $1'} | wc -l`
+		ENTERCORRECTLY="0"
+		while [ $ENTERCORRECTLY -ne 1 ]
+		do
+			read -p "Enter Number of rootfs Tarball: " TARNUMBER
+			echo " "
+			if [ -z "${TARNUMBER//[0-$COUNT]}" ] && [ -n "$TARNUMBER" ] ; then
+				ENTERCORRECTLY=1
+			else
+				echo "Invalid selection!"
+			fi
+			echo ""
+		done
 		FOUNDTARFILENAME=`ls --sort=size $ROOTFILEPARTH | grep "image" | grep 'tar.xz' | grep -n '' | grep "${TARNUMBER}:" | cut -c3- | awk {'print$1'}`
 		ROOTFSTAR=$FOUNDTARFILENAME
 
-- 
2.19.1.windows.1


