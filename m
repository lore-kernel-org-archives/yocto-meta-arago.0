Return-Path: <gleym-meta-arago@m.gmane.org>
Received: from plane.gmane.org (plane.gmane.org [80.91.229.3])
	by arago-project.org (Postfix) with ESMTPS id 2BD2052A5F
	for <meta-arago@arago-project.org>;
	Tue, 18 Mar 2014 14:15:06 +0000 (UTC)
Received: from list by plane.gmane.org with local (Exim 4.69)
	(envelope-from <gleym-meta-arago@m.gmane.org>) id 1WPunH-0003nk-NU
	for meta-arago@arago-project.org; Tue, 18 Mar 2014 15:15:04 +0100
Received: from proxysb02-out.ext.ti.com ([192.94.94.106])
	by main.gmane.org with esmtp (Gmexim 0.1 (Debian))
	id 1AlnuQ-0007hv-00
	for <meta-arago@arago-project.org>; Tue, 18 Mar 2014 15:15:03 +0100
Received: from fcooper by proxysb02-out.ext.ti.com with local (Gmexim 0.1
	(Debian)) id 1AlnuQ-0007hv-00
	for <meta-arago@arago-project.org>; Tue, 18 Mar 2014 15:15:03 +0100
X-Injected-Via-Gmane: http://gmane.org/
To: meta-arago@arago-project.org
From: Franklin Cooper Jr. <fcooper@ti.com>
Date: Tue, 18 Mar 2014 14:10:23 +0000 (UTC)
Message-ID: <loom.20140318T150747-911@post.gmane.org>
References: <1393889779-3995-1-git-send-email-denis@denix.org>
	<1393889779-3995-2-git-send-email-denis@denix.org>
Mime-Version: 1.0
X-Complaints-To: usenet@ger.gmane.org
X-Gmane-NNTP-Posting-Host: sea.gmane.org
User-Agent: Loom/3.14 (http://gmane.org/)
X-Loom-IP: 192.94.94.106 (Mozilla/5.0 (compatible; MSIE 10.0; Windows NT 6.1;
	WOW64; Trident/6.0))
Subject: Re: [tisdk-build-scripts][PATCH 1/5] run-opentest: make assigning tests to a specific TEE optional
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
X-List-Received-Date: Tue, 18 Mar 2014 14:15:06 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: 7bit

Denys Dmytriyenko <denis@...> writes:



> 

> From: Denys Dmytriyenko <denys@...>

> 

> Signed-off-by: Denys Dmytriyenko <denys@...>

> ---

>  lib/run-opentest |   12 ++++++++++--

>  1 file changed, 10 insertions(+), 2 deletions(-)

> 

> diff --git a/lib/run-opentest b/lib/run-opentest

> index 98a7dc8..c502764 100644

> --- a/lib/run-opentest

> +++ b/lib/run-opentest

>  <at>  <at>  -213,6 +213,14  <at>  <at>  run_target_side_test() {

>          OPENTEST_TEE_IP="128.247.105.52"

>      fi

> 

> +    # if OPENTEST_TEE_IP is set to "none", disable assigning to a 
specific TEE

> +    if [ "$OPENTEST_TEE_IP" == "none" ]

> +    then

> +        ASSIGN_TO_TEE=""

> +    else

> +        ASSIGN_TO_TEE="~assign_to_tees=\"vatf on $OPENTEST_TEE_IP\""

> +    fi

> +



I thought if you didn't specify a TEE nearby it can cause problems when 
your NFS directory is 100s of miles away from the TEE.



>      # if OPENTEST_HW_CAP is not set in config, default to "linux"

>      if [ -z $OPENTEST_HW_CAP ]

>      then

>  <at>  <at>  -220,8 +228,8  <at>  <at>  run_target_side_test() {

>      fi

> 

>      # Call opentest framework.  Echo the command being used for logging

> -    echo "java -jar opentest_cli_0.7.jar --template penguin --hw

> platform=$oplatform,$OPENTEST_HW_CAP --sw

> 
kernel=$kernel$dtb~kernel_modules=$spluart$uboot~nfs=$ipaddr:$nfs_dir~assign
_to_tees=\"vatf

> on $OPENTEST_TEE_IP\" --params script=/$TEST_SCRIPTS_TGT/opentest.sh"

> -    java -jar opentest_cli_0.7.jar --template penguin --hw 
platform=$oplatform,$OPENTEST_HW_CAP --sw

> 
kernel=$kernel$dtb~kernel_modules=$spluart$uboot~nfs=$ipaddr:$nfs_dir~assign
_to_tees="vatf

> on $OPENTEST_TEE_IP" --params script=/$TEST_SCRIPTS_TGT/opentest.sh

> +    echo "java -jar opentest_cli_0.7.jar --template penguin --hw

> platform=$oplatform,$OPENTEST_HW_CAP --sw

> 
kernel=$kernel$dtb~kernel_modules=$spluart$uboot~nfs=$ipaddr:$nfs_dir$ASSIGN
_TO_TEE

> --params script=/$TEST_SCRIPTS_TGT/opentest.sh"

> +    java -jar opentest_cli_0.7.jar --template penguin --hw 
platform=$oplatform,$OPENTEST_HW_CAP --sw

> 
kernel=$kernel$dtb~kernel_modules=$spluart$uboot~nfs=$ipaddr:$nfs_dir$ASSIGN
_TO_TEE

> --params script=/$TEST_SCRIPTS_TGT/opentest.sh

> 

>  
############################################################################
####

>  # Check the results of the opentest run.








