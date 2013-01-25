Return-Path: <fcooperjr27@gmail.com>
Received: from mail-oa0-f46.google.com (mail-oa0-f46.google.com
	[209.85.219.46])
	by arago-project.org (Postfix) with ESMTPS id 7B467529AA
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 21:58:54 +0000 (UTC)
Received: by mail-oa0-f46.google.com with SMTP id h16so1055965oag.33
	for <meta-arago@arago-project.org>;
	Fri, 25 Jan 2013 13:58:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=20120113;
	h=x-received:from:to:cc:subject:date:message-id:x-mailer:in-reply-to
	:references; bh=HP+VlaSWagTTZ+mYaB3chClwjIpaHOuIK87YuhXw2ZY=;
	b=aOJMfMiSiWRuIrbKN629RsUrmuP25uHQvNboj5s3xqfOLlYsyochV6TKE/asklwam9
	uIgsgWWxvTdST7kzU3xBgVe25t+2i6LEd86pmC3q5JXU6f3meznYs4c7dEyf3N0U4ox/
	ayzXpZlDN0FlCkNAwjUwzvCjNHMcNh8liRjbGPY9URm3nNCIIHjRlcHv9wsFRGmvIt2Z
	903VLafXRuk8Z4UPOM93Sq0t14L2lu/7f4zIDIkkaYyHTVZ6GE5Y4UKgMWMp9K29/+nE
	MwY6FeWZsEhA41iF22/7ui7TeebyJ2GRU4LKpgABU3LjE0TkdCKhcq05eRi+UAvW2bL1
	BpTg==
X-Received: by 10.60.7.67 with SMTP id h3mr5637159oea.31.1359151133895;
	Fri, 25 Jan 2013 13:58:53 -0800 (PST)
Received: from localhost.localdomain (dragon.ti.com. [192.94.94.33])
	by mx.google.com with ESMTPS id y4sm1625632oea.7.2013.01.25.13.58.51
	(version=TLSv1 cipher=RC4-SHA bits=128/128);
	Fri, 25 Jan 2013 13:58:52 -0800 (PST)
From: fcooperjr27@gmail.com
To: meta-arago@arago-project.org
Date: Fri, 25 Jan 2013 15:54:11 -0600
Message-Id: <1359150851-23602-30-git-send-email-fcooper@ti.com>
X-Mailer: git-send-email 1.7.0.4
In-Reply-To: <1359150851-23602-1-git-send-email-fcooper@ti.com>
References: <1359150851-23602-1-git-send-email-fcooper@ti.com>
Cc: "Franklin S. Cooper Jr" <fcooper@ti.com>
Subject: [PATCH 31/31] bash: Remove reserved word
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
X-List-Received-Date: Fri, 25 Jan 2013 21:58:54 -0000

From: Franklin S. Cooper Jr <fcooper@ti.com>

* Time is now considered a bash reserved word.
* Disable the time command within bash to allow the busybox version to work.
* This change was needed due to time -v not working due to bash interpreting the
  command.

Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
---
 .../recipes-extended/bash/bash_3.2.48.bbappend     |    3 +++
 1 files changed, 3 insertions(+), 0 deletions(-)
 create mode 100644 meta-arago-distro/recipes-extended/bash/bash_3.2.48.bbappend

diff --git a/meta-arago-distro/recipes-extended/bash/bash_3.2.48.bbappend b/meta-arago-distro/recipes-extended/bash/bash_3.2.48.bbappend
new file mode 100644
index 0000000..28a429c
--- /dev/null
+++ b/meta-arago-distro/recipes-extended/bash/bash_3.2.48.bbappend
@@ -0,0 +1,3 @@
+PR_append = "-arago0"
+
+EXTRA_OECONF += " --disable-command-timing"
-- 
1.7.0.4


