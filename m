Return-Path: <denys@ti.com>
Received: from mailout4.zoneedit.com (mailout4.zoneedit.com [64.68.198.17])
	by arago-project.org (Postfix) with ESMTPS id EE95652094
	for <meta-arago@arago-project.org>;
	Tue, 16 Oct 2018 21:18:52 +0000 (UTC)
Received: from localhost (localhost [127.0.0.1])
	by mailout4.zoneedit.com (Postfix) with ESMTP id F0CAC20D24;
	Tue, 16 Oct 2018 21:18:43 +0000 (UTC)
Received: from mailout4.zoneedit.com ([127.0.0.1])
	by localhost (zmo03-pco.easydns.vpn [127.0.0.1]) (amavisd-new,
	port 10024)
	with ESMTP id 52mCUX5ilhXl; Tue, 16 Oct 2018 21:18:43 +0000 (UTC)
Received: from mail.denix.org (pool-100-15-91-218.washdc.fios.verizon.net
	[100.15.91.218])
	(using TLSv1 with cipher DHE-RSA-AES256-SHA (256/256 bits))
	(No client certificate requested)
	by mailout4.zoneedit.com (Postfix) with ESMTPSA id CA64820D21;
	Tue, 16 Oct 2018 21:18:42 +0000 (UTC)
Received: from gimli.denix (gimli [192.168.0.6])
	by mail.denix.org (Postfix) with ESMTP id 420A6164802;
	Tue, 16 Oct 2018 17:18:42 -0400 (EDT)
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Date: Tue, 16 Oct 2018 17:18:41 -0400
Message-Id: <1539724721-46634-1-git-send-email-denys@ti.com>
X-Mailer: git-send-email 2.7.4
Subject: [rocko/master][PATCH] armnn: keep all armnn recipes in one directory
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
X-List-Received-Date: Tue, 16 Oct 2018 21:18:53 -0000

Signed-off-by: Denys Dmytriyenko <denys@ti.com>
---
 .../recipes-support/{armnn-caffe => armnn}/armnn-caffe_git.bb             | 0
 .../recipes-support/{armnn-tensorflow => armnn}/armnn-tensorflow_git.bb   | 0
 2 files changed, 0 insertions(+), 0 deletions(-)
 rename meta-arago-extras/recipes-support/{armnn-caffe => armnn}/armnn-caffe_git.bb (100%)
 rename meta-arago-extras/recipes-support/{armnn-tensorflow => armnn}/armnn-tensorflow_git.bb (100%)

diff --git a/meta-arago-extras/recipes-support/armnn-caffe/armnn-caffe_git.bb b/meta-arago-extras/recipes-support/armnn/armnn-caffe_git.bb
similarity index 100%
rename from meta-arago-extras/recipes-support/armnn-caffe/armnn-caffe_git.bb
rename to meta-arago-extras/recipes-support/armnn/armnn-caffe_git.bb
diff --git a/meta-arago-extras/recipes-support/armnn-tensorflow/armnn-tensorflow_git.bb b/meta-arago-extras/recipes-support/armnn/armnn-tensorflow_git.bb
similarity index 100%
rename from meta-arago-extras/recipes-support/armnn-tensorflow/armnn-tensorflow_git.bb
rename to meta-arago-extras/recipes-support/armnn/armnn-tensorflow_git.bb
-- 
2.7.4


