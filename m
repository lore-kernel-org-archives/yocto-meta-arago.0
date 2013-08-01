Return-Path: <gleym-meta-arago@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by arago-project.org (Postfix) with ESMTPS id C666252998
	for <meta-arago@arago-project.org>;
	Thu,  1 Aug 2013 05:40:04 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gleym-meta-arago@m.gmane.org>) id 1V4lcI-0004NS-M6
	for meta-arago@arago-project.org; Thu, 01 Aug 2013 07:40:02 +0200
Received: from http-v.fe.bosch.de ([194.39.218.10])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <meta-arago@arago-project.org>; Thu, 01 Aug 2013 07:40:02 +0200
Received: from sivaprasad.pala by http-v.fe.bosch.de with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <meta-arago@arago-project.org>; Thu, 01 Aug 2013 07:40:02 +0200
X-Injected-Via-Gmane: http://gmane.org/
To: meta-arago@arago-project.org
From: siva <sivaprasad.pala@in.bosch.com>
Date: Thu, 1 Aug 2013 05:33:47 +0000 (UTC)
Message-ID: <loom.20130801T071150-638@post.gmane.org>
References: <1366828154-17755-1-git-send-email-hzhang@ti.com>
	<8F29D6B095ED194EA1980491A5E029710C4328F5@DFLE08.ent.ti.com>
	<ECA334CFBA16F74DB2C66A2F1181F4D63C2B1F41@DLEE09.ent.ti.com>
	<20130424194115.GR12173@edge>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 194.39.218.10 (Mozilla/5.0 (X11; Ubuntu; Linux x86_64;
	rv:22.0) Gecko/20100101 Firefox/22.0)
Subject: error while building yocto for am335x
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
X-List-Received-Date: Thu, 01 Aug 2013 05:40:05 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

hello all,

I followed steps mentioned in below wiki. 
http://arago-project.org/wiki/index.php/Setting_Up_Build_Environment

I am wandering why the build is going to fail.
I tried in many ways to resolve it.(changing the definition of variable etc.)

Please find the below log.

Thanks,
Siva.
 

xxxxx@xxxxx:~/tisdk/build$ MACHINE=am335x-evm bitbake core-image-minimal
Pseudo is not present but is required, building this first before the main build
Loading cache: 100%
|##############################################################################
######################################################|
ETA:  00:00:00
Loaded 72 entries from dependency cache.
NOTE: Error during finalise of/home/xxxxx/tisdk/sources/meta-arago/
meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bb--:--

ERROR: ExpansionError during parsing/home/xxxxx/tisdk/sources/meta-arago/
meta-arago-extras/recipes-devtools/ltp-ddt/ltp-ddt-legacy_1.0.bb:

Failure expanding variable S: ExpansionError: Failure expanding variable
SRCPV, expression was ${@bb.fetch2.get_srcrev(d)} which triggered exception
FetchError: Fetcher failure: Fetch command failed with exit code 128, output:
fatal: unable to connect to arago-project.org:
arago-project.org: Name or service not known


ERROR: Command execution failed: Exited with 1

Summary: There were 2 ERROR messages shown, 
returning a non-zero exit code.
xxxxx@xxxxx:~/tisdk/build$


