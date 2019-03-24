|    <InFaultFlow>
        <handler name="PolicyBasedSecurityInHandler" class="org.apache.rampart.handler.RampartReceiver">
            <order phase="Security" phaseFirst="true"/>
        </handler>
        <handler name="SecurityInHandler" class="org.apache.rampart.handler.WSDoAllReceiver">
            <order phase="Security"/>
        </handler>
        <handler name="PostDispatchVerificationHandler" class="org.apache.rampart.handler.PostDispatchVerificationHandler">
            <order phase="Dispatch" phaseLast="true"/>
        </handler>
    </InFaultFlow> 
