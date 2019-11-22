Return-Path: <hnagalla@gmail.com>
Received: from mail-oi1-f178.google.com (mail-oi1-f178.google.com
	[209.85.167.178])
	by arago-project.org (Postfix) with ESMTPS id 12205529C2
	for <meta-arago@arago-project.org>;
	Fri, 22 Nov 2019 15:02:29 +0000 (UTC)
Received: by mail-oi1-f178.google.com with SMTP id n14so6672232oie.13
	for <meta-arago@arago-project.org>;
	Fri, 22 Nov 2019 07:01:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=Qgu3A/eDTh5T27OH9xvl85eh0XlgWxuiAJ69wVR9NK8=;
	b=LX+55IYrxH6OM8hBnfZDivyiEUK3GIot95tuJJTXQ1A8ImujxcTaiaCRjUt28UNNKT
	S5FPJnm+idHKRoP38iSBNUdLpWqorvS+kNUhGqsOjU/MpLtdhWJGDbZIjn0ND5PJuJvm
	3grf/9HDlVL2hr3VHnH68cRKkLDbx0XO2mUz9L2nS+09mX/k/ezX6TWBsQ+4xc9uL4eZ
	OgZ4Sfhqb7VhqDdEKc4EniCLsqtTI2t1+aO9s8b6iTZrQIjfv1iMlsEIneqi6Ex2C51H
	dNNIGlDIzTMezb6icf0GKVGxRM8D+873tc/5X3t2Ld9MqUA04k3zNAgm6hbgHxXD/cSI
	/fwA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=Qgu3A/eDTh5T27OH9xvl85eh0XlgWxuiAJ69wVR9NK8=;
	b=DXLWX/IoGxqAfcxm8ZsHaLQPyj6X286oyzZMYJWlzQuYatKYmd9fixQ8FJqRE3puiU
	9qKZHjG33cMKTSA4fplAWao5MrhKEdAVBLVhSphb7ds35F/TicDrRyeEUELdv8z8x78/
	ZCjY2UBiB3PKaAdNLhsyjDQZCUwESZyCEd/iLVwFDLiK53ZQ1tYyQX0J3KtlVYa3qDeG
	pyzH7uDqKGYeCA/TkSxHL4Hctcnv2r+lejfgnaFN5WzhxxpyUIExaMHfYtIE10vLl871
	VrVSroWRYiHxgdZ4IAOYLzQ7R0OLtd5MPKXud4clqL9jjEzUHvSwbmQ2ReA2Bx5tveEj
	H28A==
X-Gm-Message-State: APjAAAWTuI1+Wy6+tv4epHYWX91xDtMr+ia1IHDWUbqC/CLogExAGs10
	w0rm0xo3CaBjdhshCvuMzyeBLVS6fGk=
X-Google-Smtp-Source: APXvYqyCYN973MKbYzJrh7osx4EObDXiWjvpV2Hi0j6EXxHZQBLJXfr1eScdMqUPm5SeXkcc5ty+KQ==
X-Received: by 2002:aca:de88:: with SMTP id
	v130mr12924479oig.108.1574434860599; 
	Fri, 22 Nov 2019 07:01:00 -0800 (PST)
Received: from hari-Latitude-E6430.utdallas.edu
	(cpe-76-184-237-208.tx.res.rr.com. [76.184.237.208])
	by smtp.gmail.com with ESMTPSA id
	o203sm2109024oia.4.2019.11.22.07.00.59
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Fri, 22 Nov 2019 07:01:00 -0800 (PST)
From: Hari Nagalla <hnagalla@gmail.com>
To: meta-arago@arago-project.org
Date: Fri, 22 Nov 2019 09:00:31 -0600
Message-Id: <20191122150031.2588-4-hnagalla@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191122150031.2588-1-hnagalla@gmail.com>
References: <20191122150031.2588-1-hnagalla@gmail.com>
Subject: [ 3/3] migrate to openssl1.1
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
X-List-Received-Date: Fri, 22 Nov 2019 15:02:29 -0000

---
 .../recipes-connectivity/wpa-supplicant/wpa-supplicant.inc     | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
index 5fc3e580..65693270 100644
--- a/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
+++ b/meta-arago-extras/recipes-connectivity/wpa-supplicant/wpa-supplicant.inc
@@ -9,7 +9,7 @@ LICENSE = "GPLv2 | BSD"
 
 inherit pkgconfig
 
-DEPENDS = "gnutls dbus libnl openssl10 libgcrypt"
+DEPENDS = "gnutls dbus libnl openssl libgcrypt"
 RRECOMMENDS_${PN} = "wpa-supplicant-passphrase wpa-supplicant-cli"
 
 # To prevent users from accidently picking up this customized version of
@@ -25,6 +25,7 @@ SRC_URI = "git://git.ti.com/wilink8-wlan/hostap.git;protocol=git;branch=${BRANCH
            file://p2p_supplicant.conf \
            file://99_wpa_supplicant \
           "
+SRC_URI += "file://crypto_openssl.patch;patchdir=.."
 
 S = "${WORKDIR}/git/wpa_supplicant"
 
-- 
2.17.1


