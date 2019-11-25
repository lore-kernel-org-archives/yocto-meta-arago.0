Return-Path: <hnagalla@gmail.com>
Received: from mail-oi1-f180.google.com (mail-oi1-f180.google.com
	[209.85.167.180])
	by arago-project.org (Postfix) with ESMTPS id 1B18B529C0
	for <meta-arago@arago-project.org>;
	Mon, 25 Nov 2019 16:06:09 +0000 (UTC)
Received: by mail-oi1-f180.google.com with SMTP id v138so13564680oif.6
	for <meta-arago@arago-project.org>;
	Mon, 25 Nov 2019 08:04:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20161025;
	h=from:to:cc:subject:date:message-id:in-reply-to:references;
	bh=z+lbce1rsaiEUQWbBh/DECOpvI6q3KrWsaNFBrxzIVk=;
	b=YQrdL3L03cC/1EXC7WD40KCOL3Z8cObvpv6B3qQQeKJbRFvhqo+B9SuorG/mldEFGT
	sGI7u3dEzrfYdu6IU2ZqqwqDVdHKhhCscTZpkP3UCkWPeaOyt5p7EWqnv9xDtGsyGivH
	F91u/Thoc79lgahIeMQTDM2Eo77gV8cYUP2rSq2cCHROf7z64Q3VZvNh57G1I2v0O9C5
	BDlStVdEGyOzA92FrTsYBp7P+uan0UrzbnQxJh0dML+n/GQH+HVWocq9ERPFmCGzGxJe
	qcG5DtOoJM+NNte/EY2vE+CFiylojvZ9oMPAwRCS6vKZz8+uxk1Ar0g58w1chz0moLkw
	XVMQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=1e100.net; s=20161025;
	h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
	:references;
	bh=z+lbce1rsaiEUQWbBh/DECOpvI6q3KrWsaNFBrxzIVk=;
	b=A46BVVFiThwfMAlbkKhgXyTL59nxrvA3ywFYYqxyzftp/tvuVMLEuL7jfcw2vvQ7Pe
	f5zHLzSGJymvGNqDE3qzJ4RKDBzsmOFMzk8094KaJ3S27MHeRjcLuyxdNLml2CT+aWDm
	vviUOnG3+RulQ63DF6WKZzZnhpLs8R5i/W8g7GbydNOkT67h8vsWj0FF9JpoSTsliHfu
	ZNBKf9uUegiHGF+eYc0ojJ4t1jbfOnqzSpbE6O2Btptb52iOPf9dkQdt9rYTHeJHBE8/
	sYwtYy3J+OGTuSl/ndzCYgXdl4ZbmN/GxjgahIOeEvTUtY6sbRcedN1lVaplGbodBZt0
	94SQ==
X-Gm-Message-State: APjAAAVdoXVm9kMnmYfEQkj932HKSg6moP52AiPF8kOirmEGa3mMnAbd
	ow9ZiSPJPeitsXDiyW5fZpgQxqLu9HY=
X-Google-Smtp-Source: APXvYqx1nn3Q+RNnVaGOd6zqWH4hFuZhaA2FWUS5+ZxG/yTTr59wfktfCgh3C412VYQPTJKLuYE1qg==
X-Received: by 2002:aca:42d7:: with SMTP id
	p206mr23863509oia.129.1574697879810; 
	Mon, 25 Nov 2019 08:04:39 -0800 (PST)
Received: from hari-Latitude-E6430.utdallas.edu
	(cpe-76-184-237-208.tx.res.rr.com. [76.184.237.208])
	by smtp.gmail.com with ESMTPSA id
	v11sm2517693ota.13.2019.11.25.08.04.38
	(version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
	Mon, 25 Nov 2019 08:04:39 -0800 (PST)
From: Hari Nagalla <hnagalla@gmail.com>
To: meta-arago@arago-project.org
Date: Mon, 25 Nov 2019 10:04:19 -0600
Message-Id: <20191125160419.4096-2-hnagalla@gmail.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20191125160419.4096-1-hnagalla@gmail.com>
References: <20191125160419.4096-1-hnagalla@gmail.com>
Subject: [ 1/1] Include wireless-regdb/crda
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
X-List-Received-Date: Mon, 25 Nov 2019 16:06:09 -0000

---
 .../packagegroups/packagegroup-arago-tisdk-connectivity.bb      | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
index cc7da736..21dc6d0f 100644
--- a/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
+++ b/meta-arago-distro/recipes-core/packagegroups/packagegroup-arago-tisdk-connectivity.bb
@@ -8,11 +8,13 @@ inherit packagegroup
 
 # WLAN support packages.
 # These are the packages that all platforms use for WLAN support
+# add wireless-regdb
 WLAN_COMMON = "\
     iw \
     softap-udhcpd-config \
     eventdump \
     wlconf \
+    wireless-regdb \
     linux-firmware-iwlwifi-8000c \
     linux-firmware-iwlwifi-8265 \
     linux-firmware-iwlwifi-3160-17 \
-- 
2.17.1


