Return-Path: <tom.rini@gmail.com>
Received: from mail-qc0-f182.google.com (mail-qc0-f182.google.com
	[209.85.216.182])
	by arago-project.org (Postfix) with ESMTPS id B19425299B
	for <meta-arago@arago-project.org>;
	Wed, 23 Oct 2013 18:26:26 +0000 (UTC)
Received: by mail-qc0-f182.google.com with SMTP id n7so715796qcx.27
	for <meta-arago@arago-project.org>;
	Wed, 23 Oct 2013 11:26:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=sender:from:to:subject:date:message-id;
	bh=JwJsCTIq8sj38p4f3c0223ZjNYHurJPtPAe1LvbM3jI=;
	b=M1oPLMA0rNzUvz24j/3EnLrGPJ3KT6XzsaA1aLQxdxFVhj6Bu5+pPZ+WfREm+37u+L
	DJNh3UfOKKWqGyf3cPprjMFTWQqzbsrKGqyZAA+UBzU97EMhdoPtHVqCvKy/eLtu7K5A
	XZEbm1dpXcPKFHMe0+rvEY0kxUHiRZgKBRwdnKLX/iwHHyB8p3n5XdpATnnL3Ql41sGO
	xaLzwZTRqaJNOCafxUHyoTANW/XQ534YwyQeFkn0zCN4z42hWUD9+EFgDt1QuOPK/fve
	JzUJ/K7hcBXHG+N4FaIlfTN7sItkK+7ebR0L+qe+VICE1qWVIhcXih8FpGXrUhN7vciI
	p1Ug==
X-Received: by 10.224.54.129 with SMTP id q1mr5797149qag.19.1382552786164;
	Wed, 23 Oct 2013 11:26:26 -0700 (PDT)
Received: from localhost.localdomain (cpe-174-106-216-211.ec.res.rr.com.
	[174.106.216.211])
	by mx.google.com with ESMTPSA id 5sm63987969qao.3.2013.10.23.11.26.24
	for <meta-arago@arago-project.org>
	(version=TLSv1.1 cipher=ECDHE-RSA-RC4-SHA bits=128/128);
	Wed, 23 Oct 2013 11:26:24 -0700 (PDT)
Sender: Tom Rini <tom.rini@gmail.com>
From: Tom Rini <trini@ti.com>
To: meta-arago@arago-project.org
Date: Wed, 23 Oct 2013 14:26:14 -0400
Message-Id: <1382552778-29138-1-git-send-email-trini@ti.com>
X-Mailer: git-send-email 1.7.9.5
Subject: [PATCH 0/3] Update SD card auto-mounting
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
X-List-Received-Date: Wed, 23 Oct 2013 18:26:27 -0000

The following short series gets SD card auto-mounting working again.  I
don't know if we want to try and push this new method upstream or if
it's been decided to be distro policy (I assume the latter).  This
enables 'stat' on our busybox config which as the commit message
explains is quite hard to replicate in just shell and avoids requiring
coreutils and is a re-sync with openembedded-core.  This is needed since
/etc/udev/scripts/mount.sh requires 'stat' to exist and work for
auto-mounting of things not in /etc/fstab.  The next change adds a udev
rule for mounting (and cleaning up) on SD card insertion (technically
all mmcblk devices, so eMMC too, which is helpful).  Finally, we drop
the mount-sdcard package and initscript as we don't need it anymore.

-- 
Tom


