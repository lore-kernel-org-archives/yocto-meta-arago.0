Return-Path: <denis@denix.org>
Received: from vms173021pub.verizon.net (vms173021pub.verizon.net
	[206.46.173.21])
	by arago-project.org (Postfix) with ESMTP id 7D66E529AA
	for <meta-arago@arago-project.org>;
	Wed, 30 Jan 2013 22:12:49 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.12])
	by vms173021.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MHG000RSLOI0DA1@vms173021.mailsrvcs.net> for
	meta-arago@arago-project.org; Wed, 30 Jan 2013 16:12:33 -0600 (CST)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 4DBB52008D; Wed,
	30 Jan 2013 17:12:17 -0500 (EST)
Date: Wed, 30 Jan 2013 17:12:17 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: meta-arago@arago-project.org
Message-id: <20130130221217.GA1060@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: Danny migration
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
X-List-Received-Date: Wed, 30 Jan 2013 22:12:49 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

All,

I've started migrating meta-arago from "denzil" stable branch (based on the 
Yocto Project 1.2) to "danny" stable branch (Yocto Project 1.3).

Please use arago-danny-config from oe-layersetup:
http://arago-project.org/git/projects/?p=oe-layersetup.git;a=summary

The first set of generic fixes is now in meta-arago master. There are still 
plenty of issues. The biggest being the absence of gcc-4.5 base recipes to 
support packaging of the Arago toolchain into the filesystem images. I'm 
looking into a short-term fix of overlaying those, until we move to a newer 
toolchain for our SDKs. But it's still possible to use Arago gcc-4.5 based 
toolchain for now to build packages, but not images, as TC is not packaged 
itself.

There are other lingering issues and I'm going through them now. I may not be 
able to accept your fixes/patches right now or for the next couple of days, 
while I'm still working on the basic porting/migration issues...

Please let me know of any issues or concerns. Thanks.

-- 
Denys

