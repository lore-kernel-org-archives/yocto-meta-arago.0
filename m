Return-Path: <denys@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by arago-project.org (Postfix) with ESMTPS id 4019B52A0A
	for <meta-arago@arago-project.org>;
	Mon, 10 Feb 2014 17:01:39 +0000 (UTC)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id s1AH1c5T012194
	for <meta-arago@arago-project.org>; Mon, 10 Feb 2014 11:01:38 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1AH1ctq005047
	for <meta-arago@arago-project.org>; Mon, 10 Feb 2014 11:01:38 -0600
Received: from dlep33.itg.ti.com (157.170.170.75) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 10 Feb 2014 11:01:37 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s1AH1biI013537	for
	<meta-arago@arago-project.org>; Mon, 10 Feb 2014 11:01:37 -0600
Date: Mon, 10 Feb 2014 12:01:37 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: <meta-arago@arago-project.org>
Message-ID: <20140210170137.GB3131@edge>
MIME-Version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Heads up - Dora will be taking over master
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
X-List-Received-Date: Mon, 10 Feb 2014 17:01:39 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

All,

Just a heads up - while we are finishing up our LCPD CoreSDK release this 
week, I'd like to branch off Dylan into a separate branch and free up master 
for the Dora work, that's been going on in the background for a while. I'll 
start pushing cleanup patches that Chase and I were working on right after 
"dylan" branch is ready. If your work is still based on Dylan and you point 
your config to meta-arago/master, you should update your configuration with 
the new branch soon. No changes to meta-ti, as it already has all necessary 
branches. Please let me know if you have any concerns or questions. Thanks.

-- 
Denys

