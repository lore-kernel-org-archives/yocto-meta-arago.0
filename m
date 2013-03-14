Return-Path: <denis@denix.org>
Received: from vms173013pub.verizon.net (vms173013pub.verizon.net
	[206.46.173.13])
	by arago-project.org (Postfix) with ESMTP id 3FE6152A47
	for <meta-arago@arago-project.org>;
	Thu, 14 Mar 2013 16:16:21 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [108.45.150.102])
	by vms173013.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MJN00587RUNPR91@vms173013.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 14 Mar 2013 11:16:00 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 2A2AD201B1; Thu,
	14 Mar 2013 12:15:58 -0400 (EDT)
Date: Thu, 14 Mar 2013 12:15:58 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: meta-ti@yoctoproject.org, meta-arago@arago-project.org
Message-id: <20130314161558.GA14761@denix.org>
MIME-version: 1.0
User-Agent: Mutt/1.5.20 (2009-06-14)
Subject: svn: Unknown hostname 'gcc.gnu.org'
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
X-List-Received-Date: Thu, 14 Mar 2013 16:16:21 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

All,

If you see a breakage this morning with a "danny" based configuration 
containing meta-linaro layer, that looks like this:

ExpansionError: Failure expanding variable SRCPV, expression was ${@bb.fetch2.get_srcrev(d)} which triggered exception FetchError:
Fetcher failure: Fetch command failed with exit code 1, output:
svn: Unknown hostname 'gcc.gnu.org'

then it is caused by the latest change in meta-linaro as it relates to the 
toolchain and other pieces being moved around. Unfortunately, meta-linaro 
didn't have a "danny" dedicated branch and major changes like that break 
stable configs. I've talked to Marcin and he's creating a "danny" branch right 
now. I'm updating oe-layersetup configs for that change, if you use it. 
Otherwise, update your bblayers.conf accordingly.

-- 
Denys

