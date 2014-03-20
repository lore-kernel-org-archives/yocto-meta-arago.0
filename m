Return-Path: <denis@denix.org>
Received: from vms173023pub.verizon.net (vms173023pub.verizon.net
	[206.46.173.23])
	by arago-project.org (Postfix) with ESMTP id 5D058529BA
	for <meta-arago@arago-project.org>;
	Thu, 20 Mar 2014 18:30:45 +0000 (UTC)
Received: from gandalf.denix.org ([unknown] [71.191.205.189])
	by vms173023.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0N2Q005YKZE5NX20@vms173023.mailsrvcs.net> for
	meta-arago@arago-project.org; Thu, 20 Mar 2014 13:30:20 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 9D4A2203C1; Thu,
	20 Mar 2014 14:30:04 -0400 (EDT)
Date: Thu, 20 Mar 2014 14:30:04 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-id: <20140320183004.GA3370@denix.org>
References: <1393889779-3995-1-git-send-email-denis@denix.org>
	<1393889779-3995-5-git-send-email-denis@denix.org>
	<8F29D6B095ED194EA1980491A5E029710C668606@DFLE08.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C66AAE0@DFLE08.ent.ti.com>
MIME-version: 1.0
In-reply-to: <8F29D6B095ED194EA1980491A5E029710C66AAE0@DFLE08.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-arago@arago-project.org" <meta-arago@arago-project.org>
Subject: Re: [tisdk-build-scripts][PATCH 4/5] linux-devtest.tgz: add new version of OpenTest CLI 13.11
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
X-List-Received-Date: Thu, 20 Mar 2014 18:30:45 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Thu, Mar 20, 2014 at 06:13:12PM +0000, Cooper Jr., Franklin wrote:
> Sorry sent this before but apparently I didn't use reply all.
> ________________________________________
> From: Cooper Jr., Franklin
> Sent: Tuesday, March 18, 2014 9:27 AM
> To: Denys Dmytriyenko
> Subject: RE: [meta-arago] [tisdk-build-scripts][PATCH 4/5] linux-devtest.tgz: add new version of OpenTest CLI 13.11
> 
> Any reason why we need to name this linux-devtest.tgz instead of opentest_cli_xxx.tar.gz?
> 
> It would just make it easier to recognize what this tarball contains.

The main reason being this is AS IS tarball that comes directly from OpenTest 
install. I didn't want to change it - either rename or change the new 
directory structure. This way it should be very straightforward to update to 
new versions in the future.

-- 
Denys

