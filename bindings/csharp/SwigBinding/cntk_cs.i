%module(directors="1") CSharpBindings
//%feature("autodoc", "1");

%include <stl.i>
%include <std_wstring.i>
%include <std_vector.i>
%include <std_map.i>
%include <std_pair.i>
%include <std_shared_ptr.i>
%include <windows.i>
%include <attribute.i>
%include <arrays_csharp.i>

// include the unordered_map.i.
%include "std_unordered_map.i"

%{
    #include "CNTKLibrary.h"
    #pragma warning(disable : 4100)
%}

%nspace CNTK;

%shared_ptr(CNTK::BackPropState);
%shared_ptr(CNTK::Function);
%shared_ptr(CNTK::CompositeFunction);
%shared_ptr(CNTK::Value);
%shared_ptr(CNTK::NDShape);
%shared_ptr(CNTK::NDArrayView);
%shared_ptr(CNTK::NDMask);
%shared_ptr(std::vector<float>);

%template(SizeTVector) std::vector<size_t>;
%template(BoolVector) std::vector<bool>;
%template(DoubleVector) std::vector<double>;
%template(FloatVector) std::vector<float>;
%template(SizeTVectorVector) std::vector<std::vector<size_t>>;
%template(FloatVectorVector) std::vector<std::vector<float>>;
%template(DoubleVectorVector) std::vector<std::vector<double>>;
%template(VariableVector) std::vector<CNTK::Variable>;
%template(AxisVector) std::vector<CNTK::Axis>;
%template(DeviceDescriptorVector) std::vector<CNTK::DeviceDescriptor>;
%template(UnorderedMapVariableValuePtr) std::unordered_map<CNTK::Variable, std::shared_ptr<CNTK::Value>>;
%template(UnorderedMapVariableVariable) std::unordered_map<CNTK::Variable, CNTK::Variable>;

%template() std::vector<std::shared_ptr<CNTK::Function>>;
%template() std::vector<std::shared_ptr<CNTK::Learner>>;
%template() std::pair<size_t, double>;
%template() std::vector<std::pair<size_t, double>>;

// Ignore things not exposed for C# Eval.
%ignore CNTK::NDShape::NDShape(const std::initializer_list<size_t>& dimensions);

%ignore CNTK::Internal::GenerateUid(std::wstring&& prefix);
%ignore CNTK::Internal::GenerateUid(VariableKind varKind);
%ignore CNTK::Internal::GenerateUid(const std::wstring& prefix);

%ignore CNTK::PlaceholderVariable(const NDShape& shape, const std::wstring& name, const std::vector<Axis>& dynamicAxes = Axis::UnknownDynamicAxes());
%ignore CNTK::PlaceholderVariable(const NDShape& shape, const std::vector<Axis>& dynamicAxes = Axis::UnknownDynamicAxes());
%ignore CNTK::PlaceholderVariable(const std::wstring& name = L"");

%ignore CNTK::InputVariable(const NDShape& shape,
                            bool isSparse, 
                            ::CNTK::DataType dataType, 
                            bool needsGradient, 
                            const std::wstring& name, 
                            const std::vector<Axis>& dynamicAxes = Axis::DefaultInputVariableDynamicAxes());
%ignore CNTK::InputVariable(const NDShape& shape, 
                            ::CNTK::DataType dataType, 
                            bool needsGradient, 
                            const std::wstring& name = L"", 
                            const std::vector<Axis>& dynamicAxes = Axis::DefaultInputVariableDynamicAxes());
%ignore CNTK::InputVariable(const NDShape& shape, 
                            DataType dataType, 
                            const std::wstring& name, 
                            const std::vector<Axis>& 
                            dynamicAxes = Axis::DefaultInputVariableDynamicAxes());
%ignore CNTK::InputVariable(const NDShape& shape, 
                            DataType dataType, 
                            const wchar_t* name, 
                            const std::vector<Axis>& dynamicAxes = Axis::DefaultInputVariableDynamicAxes());
%ignore CNTK::InputVariable(const NDShape& shape, 
                            DataType dataType, 
                            const std::vector<Axis>& dynamicAxes = Axis::DefaultInputVariableDynamicAxes());
%ignore CNTK::InputVariable(const NDShape& shape, 
                            bool isSparse, 
                            ::CNTK::DataType dataType, 
                            const std::wstring& name, 
                            const std::vector<Axis>& dynamicAxes = Axis::DefaultInputVariableDynamicAxes());
%ignore CNTK::InputVariable(const NDShape& shape, 
                            bool isSparse, 
                            ::CNTK::DataType dataType,
                            const wchar_t* name, 
                            const std::vector<Axis>& dynamicAxes = Axis::DefaultInputVariableDynamicAxes());
%ignore CNTK::InputVariable(const NDShape& shape, 
                            bool isSparse, 
                            ::CNTK::DataType dataType, 
                            const std::vector<Axis>& dynamicAxes = Axis::DefaultInputVariableDynamicAxes());

%ignore CNTK::OutputVariable(const NDShape& shape, 
                             ::CNTK::DataType dataType, 
                             Function* ownerFunction, 
                             const std::vector<Axis>& dynamicAxes, 
                             const std::wstring& name = L"");

%ignore CNTK::Variable::CompositeFunction;
%ignore CNTK::Variable::Trainer;
%ignore CNTK::Varaiable::PrimitiveFunction;

%ignore CNTK::ConstantInitializer(double value = 0.0);
%ignore CNTK::UniformInitializer(double scale = DefaultParamInitScale, unsigned long seed = SentinelValueForAutoSelectRandomSeed);
%ignore CNTK::GaussianInitializer(int outputRank = SentinelValueForInferParamInitRank, 
                                  int filterRank = SentinelValueForInferParamInitRank, 
                                  double scale = DefaultParamInitScale, 
                                  unsigned long seed = SentinelValueForAutoSelectRandomSeed);
%ignore CNTK::XavierInitializer(int outputRank = SentinelValueForInferParamInitRank, 
                                int filterRank = SentinelValueForInferParamInitRank, 
                                double scale = DefaultParamInitScale, 
                                unsigned long seed = SentinelValueForAutoSelectRandomSeed);
%ignore CNTK::GlorotUniformInitializer(int outputRank = SentinelValueForInferParamInitRank, 
                                       int filterRank = SentinelValueForInferParamInitRank, 
                                       double scale = DefaultParamInitScale, 
                                       unsigned long seed = SentinelValueForAutoSelectRandomSeed);
%ignore CNTK::GlorotNormalInitializer(int outputRank = SentinelValueForInferParamInitRank, 
                                      int filterRank = SentinelValueForInferParamInitRank, 
                                      double scale = DefaultParamInitScale, 
                                      unsigned long seed = SentinelValueForAutoSelectRandomSeed);
%ignore CNTK::HeUniformInitializer(int outputRank = SentinelValueForInferParamInitRank, 
                                   int filterRank = SentinelValueForInferParamInitRank, 
                                   double scale = DefaultParamInitScale, 
                                   unsigned long seed = SentinelValueForAutoSelectRandomSeed);
%ignore CNTK::HeNormalInitializer(int outputRank = SentinelValueForInferParamInitRank, 
                                  int filterRank = SentinelValueForInferParamInitRank, 
                                  double scale = DefaultParamInitScale, 
                                  unsigned long seed = SentinelValueForAutoSelectRandomSeed);
%ignore CNTK::BilinearInitializer(size_t kernelWidth, size_t kernelHeight);
%ignore CNTK::RandomInitializerWithRank(const ParameterInitializer& initializer, int outputRank, int filterRank);

%ignore CNTK::IDictionarySerializable;
%ignore CNTK::DictionaryValue;
%ignore CNTK::Dictionary;
%ignore CNTK::ParameterInitializer;

%ignore std::hash<::CNTK::Parameter>;
%ignore CNTK::hash<::CNTK::Constant>;

%ignore CNTK::Function::CompositeFunction;
%ignore CNTK::Function::Trainer;
%ignore CNTK::Function::Backward(const BackPropStatePtr& state,
                                 const std::unordered_map<Variable, ValuePtr>& rootGradientValues,
                                 std::unordered_map<Variable, ValuePtr>& backPropagatedGradientValuesForInputs);
%ignore CNTK::Function::Forward(const std::unordered_map<Variable, ValuePtr>& arguments, 
                                std::unordered_map<Variable, ValuePtr>& outputs, 
                                const DeviceDescriptor& computeDevice = DeviceDescriptor::UseDefaultDevice(), 
                                const std::unordered_set<Variable>& outputsToRetainBackwardStateFor = {});
%ignore CNTK::Function::Serialize() const;
%ignore CNTK::Function::Deserialize(const Dictionary& dictionary, const ::CNTK::DeviceDescriptor& device = DeviceDescriptor::UseDefaultDevice());
%ignore CNTK::Function::Parameters() const;
%ignore CNTK::Function::Constants() const;
%ignore CNTK::Function::Placeholders() const;
%ignore CNTK::Function::Attributes() const;
%ignore CNTK::Function::PrintGraph() const;
%ignore CNTK::Function::ReplacePlaceholders(const std::unordered_map<Variable, Variable>& placeholderReplacements);
%ignore CNTK::Function::ReplacePlaceholder(const Variable& placeholderReplacement);
%ignore CNTK::Function::Function(const std::vector<Variable>& inputs, 
                                 const std::vector<Variable>& outputs,
                                 Dictionary&& functionConfig,
                                 const std::wstring& name = L"",
                                 const std::wstring& uid = Internal::GenerateUid(L"UserDefinedFunction"));
%ignore CNTK::Function::RestoreFromCheckpoint(const Dictionary& dictionary);

%ignore CNTK::Parameter;
%ignore CNTK::Constant;
%ignore CNTK::BackPropState;
%ignore CNTK::PoolingType;

%ignore CNTK::Negate(const Variable& operand, const std::wstring& name = L"");
%ignore CNTK::operator-(const Variable& operand);
%ignore CNTK::Sigmoid(const Variable& operand, const std::wstring& name = L"");
%ignore CNTK::Tanh(const Variable& operand, const std::wstring& name = L"");
%ignore CNTK::Sin(const Variable& operand, const std::wstring& name = L"");
%ignore CNTK::Cos(const Variable& operand, const std::wstring& name = L"");
%ignore CNTK::ReLU(const Variable& operand, const std::wstring& name = L"");
%ignore CNTK::Exp(const Variable& operand, const std::wstring& name = L"");
%ignore CNTK::Log(const Variable& operand, const std::wstring& name = L"");
%ignore CNTK::Square(const Variable& operand, const std::wstring& name = L"");
%ignore CNTK::Sqrt(const Variable& operand, const std::wstring& name = L"");
%ignore CNTK::Round(const Variable& operand, const std::wstring& name = L"");
%ignore CNTK::Floor(const Variable& operand, const std::wstring& name = L"");
%ignore CNTK::Ceil(const Variable& operand, const std::wstring& name = L"");
%ignore CNTK::Abs(const Variable& operand, const std::wstring& name = L"");
%ignore CNTK::Reciprocal(const Variable& operand, const std::wstring& name = L"");
%ignore CNTK::Softmax(const Variable& operand, const std::wstring& name = L"");
%ignore CNTK::Hardmax(const Variable& operand, const std::wstring& name = L"");
%ignore CNTK::TransposeAxes(const Variable& operand, const Axis& axis1, const Axis& axis2, const std::wstring& name = L"");
%ignore CNTK::Transpose(const Variable& operand, const std::wstring& name = L"");
%ignore CNTK::Slice(const Variable& operand, const Axis& axis, int beginIndex, int endIndex, const std::wstring& name = L"");
%ignore CNTK::RandomSample(const Variable& operand, size_t numSamples, bool allowDuplicates, const std::wstring& name);
%ignore CNTK::RandomSampleInclusionFrequency(const Variable& operand, size_t numSamples, bool allowDuplicates, const std::wstring& name);
%ignore CNTK::Dropout(const Variable& operand, double dropoutRate, const std::wstring& name = L"");
%ignore CNTK::Reshape(const Variable& operand, const NDShape& newShape, const std::wstring& name = L"");
%ignore CNTK::Plus(const Variable& leftOperand, const Variable& rightOperand, const std::wstring& name = L"");
%ignore CNTK::operator+(const Variable& leftOperand, const Variable& rightOperand);
%ignore CNTK::Minus(const Variable& leftOperand, const Variable& rightOperand, const std::wstring& name = L"");
%ignore CNTK::operator-(const Variable& leftOperand, const Variable& rightOperand);
%ignore CNTK::LogAddExp(const Variable& leftOperand, const Variable& rightOperand, const std::wstring& name = L"");
%ignore CNTK::ElementTimes(const Variable& leftOperand, const Variable& rightOperand, const std::wstring& name = L"");
%ignore CNTK::ElementDivide(const Variable& leftOperand, const Variable& rightOperand, const std::wstring& name = L"");
%ignore CNTK::Equal(const Variable& leftOperand, const Variable& rightOperand, const std::wstring& name = L"");
%ignore CNTK::NotEqual(const Variable& leftOperand, const Variable& rightOperand, const std::wstring& name = L"");
%ignore CNTK::Less(const Variable& leftOperand, const Variable& rightOperand, const std::wstring& name = L"");
%ignore CNTK::LessEqual(const Variable& leftOperand, const Variable& rightOperand, const std::wstring& name = L"");
%ignore CNTK::Greater(const Variable& leftOperand, const Variable& rightOperand, const std::wstring& name = L"");
%ignore CNTK::GreaterEqual(const Variable& leftOperand, const Variable& rightOperand, const std::wstring& name = L"");
%ignore CNTK::Times(const Variable& leftOperand, const Variable& rightOperand, size_t outputRank, int inferInputRankToMap, const std::wstring& name = L"");
%ignore CNTK::Times(const Variable& leftOperand, const Variable& rightOperand, size_t outputRank, const std::wstring& name = L"");
%ignore CNTK::Times(const Variable& leftOperand, const Variable& rightOperand, const std::wstring& name = L"");
%ignore CNTK::TransposeTimes(const Variable& leftOperand, const Variable& rightOperand, size_t outputRank, const std::wstring& name = L"");
%ignore CNTK::TransposeTimes(const Variable& leftOperand, const Variable& rightOperand, const std::wstring& name = L"");
%ignore CNTK::CosineDistance(const Variable& leftOperand, const Variable& rightOperand, const std::wstring& name = L"");
%ignore CNTK::BinaryCrossEntropy(const Variable& prediction, const Variable& targets, const std::wstring& name = L"");
%ignore CNTK::WeightedBinaryCrossEntropy(const Variable& prediction, const Variable& targets, const Variable& weights, const std::wstring& name = L"");
%ignore CNTK::SquaredError(const Variable& prediction, const Variable& targets, const std::wstring& name = L"");
%ignore CNTK::CrossEntropyWithSoftmax(const Variable& prediction, const Variable& labels, const Axis& axis, const std::wstring& name = L"");
%ignore CNTK::CrossEntropyWithSoftmax(const Variable& prediction, const Variable& labels, const std::wstring& name = L"");
%ignore CNTK::ClassificationError(const Variable& prediction, const Variable& labels, size_t topN, const Axis& axis, const std::wstring& name = L"");
%ignore CNTK::ClassificationError(const Variable& prediction, const Variable& labels, size_t topN, const std::wstring& name = L"");
%ignore CNTK::ClassificationError(const Variable& prediction, const Variable& labels, const Axis& axis, const std::wstring& name = L"");
%ignore CNTK::ClassificationError(const Variable& prediction, const Variable& labels, const std::wstring& name = L"");
%ignore CNTK::PastValue(const Variable& operand, const Variable& initialState, size_t offset = 1, const std::wstring& name = L"");
%ignore CNTK::PastValue(const Variable& operand, size_t offset = 1, const std::wstring& name = L"");
%ignore CNTK::FutureValue(const Variable& operand, const Variable& initialState, size_t offset = 1, const std::wstring& name = L"");
%ignore CNTK::FutureValue(const Variable& operand, size_t offset = 1, const std::wstring& name = L"");
%ignore CNTK::ReduceSum(const Variable& operand, const std::wstring& name = L"");
%ignore CNTK::ReduceSum(const Variable& operand, const Axis& axis, const std::wstring& name = L"");
%ignore CNTK::ReduceLogSum(const Variable& operand, const Axis& axis, const std::wstring& name = L"");
%ignore CNTK::ReduceMean(const Variable& operand, const Axis& axis, const std::wstring& name = L"");
%ignore CNTK::ReduceMax(const Variable& operand, const Axis& axis, const std::wstring& name = L"");
%ignore CNTK::ReduceMin(const Variable& operand, const Axis& axis, const std::wstring& name = L"");
%ignore CNTK::PerDimMeanVarianceNormalize(const Variable& operand, const NDArrayViewPtr& mean, const NDArrayViewPtr& invStdDev, const std::wstring& name = L"");
%ignore CNTK::Convolution(const Variable& convolutionMap,
                          const Variable& operand,
                          const NDShape& strides = {1}, 
                          const std::vector<bool>& sharing = {true},
                          const std::vector<bool>& autoPadding = {true}, 
                          const NDShape& lowerPad = {0},
                          const NDShape& upperPad = {0}, 
                          bool transpose = false, 
                          size_t maxTempMemSizeInSamples = 0, 
                          const std::wstring& name = L"");
%ignore CNTK::ROIPooling(const Variable& convolutionMap, const Variable& rois, const NDShape& roiOutputShape, const std::wstring& name = L"");

%ignore CNTK::Pooling(const Variable& operand, 
                      PoolingType poolingType, 
                      const NDShape& poolingWindowShape, 
                      const NDShape& strides = {1}, 
                      const std::vector<bool>& autoPadding = {false},
                      const NDShape& lowerPad = {0}, 
                      const NDShape& upperPad = {0}, 
                      const std::wstring& name = L"");
%ignore CNTK::BatchNormalization(const Variable& operand, 
                                 const Variable& scale, 
                                 const Variable& bias, 
                                 const Variable& runningMean, 
                                 const Variable& runningInvStd, 
                                 bool spatial,
                                 double normalizationTimeConstant = 0, 
                                 double blendTimeConstant = 0, 
                                 double epsilon = 0.00001, 
                                 bool useCuDNNEngine = false, 
                                 const std::wstring& name = L"");
%ignore CNTK::OptimizedRNNStack(const Variable& operand, 
                                const Variable& weights, 
                                size_t hiddenSize, 
                                size_t numLayers, 
                                bool bidirectional = false, 
                                const std::wstring& recurrentOp = L"lstm", 
                                const std::wstring& name = L"");
%ignore CNTK::Clip(const Variable& operand, const Variable& min, const Variable& max, const std::wstring& name = L"");
%ignore CNTK::ElementSelect(const Variable& condition, const Variable& leftOperand, const Variable& rightOperand, const std::wstring& name = L"");
%ignore CNTK::Splice(const std::vector<Variable>& operands, const Axis& axis, const std::wstring& name = L"");

%ignore CNTK::Sequence;

%ignore CNTK::TrainingParameterSchedule;
%ignore CNTK::TrainingParameterPerUnitSchedule;
%ignore CNTK::TrainingParameterPerSampleSchedule;
%ignore CNTK::TrainingParameterPerMinibatchSchedule;
%ignore CNTK::LearningRateSchedule;
%ignore CNTK::LearningRatePerSampleSchedule;
%ignore CNTK::LearningRatePerMinibatchSchedule;
%ignore CNTK::MomentumAsTimeConstantSchedule;
%ignore CNTK::AdditionalLearningOptions;
%ignore CNTK::Learner;

%ignore CNTK::SGDLearner(const std::vector<Parameter>& parameters, 
                         const LearningRateSchedule& learningRateSchedule, 
                         AdditionalLearningOptions additionalOptions = AdditionalLearningOptions());
%ignore CNTK::MomentumSGDLearner(const std::vector<Parameter>& parameters, 
                                 const LearningRateSchedule& learningRateSchedule, 
                                 const MomentumSchedule& momentumSchedule, 
                                 AdditionalLearningOptions additionalOptions = AdditionalLearningOptions());
%ignore CNTK::NesterovLearner(const std::vector<Parameter>& parameters, 
                              const LearningRateSchedule& learningRateSchedule, 
                              const MomentumSchedule& momentumSchedule, 
                              AdditionalLearningOptions additionalOptions = AdditionalLearningOptions());
%ignore CNTK::DefaultVarianceMomentum;
%ignore CNTK::AdamLearner(const std::vector<Parameter>& parameters, 
                          const LearningRateSchedule& learningRateSchedule, 
                          const MomentumSchedule& momentumSchedule, 
                          const MomentumSchedule& varianceMomentumSchedule = DefaultVarianceMomentum, 
                          bool lowMemory = true, 
                          AdditionalLearningOptions additionalOptions = AdditionalLearningOptions());
%ignore CNTK::AdaGradLearner(const std::vector<Parameter>& parameters, 
                             const LearningRateSchedule& learningRateSchedule, 
                             bool needAveMultiplier = true, 
                             AdditionalLearningOptions additionalOptions = AdditionalLearningOptions());
%ignore CNTK::RMSPropLearner(const std::vector<Parameter>& parameters,
                             const LearningRateSchedule& learningRateSchedule, 
                             double gamma, 
                             double inc, 
                             double dec, 
                             double max, 
                             double min, 
                             bool needAveMultiplier = true, 
                             AdditionalLearningOptions additionalOptions = AdditionalLearningOptions());

%ignore CNTK::Trainer;
%ignore CNTK::StreamInformation;
%ignore std::hash<::CNTK::StreamInformation>;

%ignore CNTK::MinibatchData;
%ignore CNTK::MinibatchSource;
%ignore CNTK::CreateCompositeMinibatchSource(const Dictionary& configuration);
%ignore CNTK::StreamConfiguration;
%ignore CNTK::TextFormatMinibatchSource;
%ignore CNTK::ComputeInputPerDimMeansAndInvStdDevs;
%ignore CNTK::DistributedWorkerDescriptor;
%ignore CNTK::operator==(const DistributedWorkerDescriptor& left, const DistributedWorkerDescriptor& right);
%ignore CNTK::DistributedCommunicator;
%ignore CNTK::QuantizedDistributedCommunicator;
%ignore CNTK::MPICommunicator();
%ignore CNTK::QuantizedMPICommunicator(bool zeroThresholdFor1Bit, bool useQuantizationForSelfStripe, size_t numQuantizationBits);
%ignore CNTK::MinibatchInfo;
%ignore CNTK::DistributedTrainer;
%ignore CNTK::CreateDataParallelDistributedTrainer(DistributedCommunicatorPtr communicator, bool useAsyncBufferedParameterUpdate, size_t distributedAfterSampleCount = 0);
%ignore CNTK::CreateQuantizedDataParallelDistributedTrainer(QuantizedDistributedCommunicatorPtr communicator, 
                                                            bool useAsyncBufferedParameterUpdate, 
                                                            size_t distributedAfterSampleCount);
%ignore CNTK::CreateBlockMomentumDistributedTrainer;

%ignore std::hash<::CNTK::DistributedWorkerDescriptor>;

// Todo: add correct typemap as they might be useful for C# in future.
%ignore CNTK::NDMask::DataBuffer() const;


// map the pointer to array
%apply float INPUT[]  { float *dataBuffer }
%apply double INPUT[]  { double *dataBuffer }

%rename (GetAllDevices) CNTK::DeviceDescriptor::AllDevices;
%rename (GetBestDevice) CNTK::DeviceDescriptor::BestDevice;
%rename (GetDefaultDevice) CNTK::DeviceDescriptor::DefaultDevice;
%rename (GetCPUDevice) CNTK::DeviceDescriptor::CPUDevice;
%rename (GetDeviceType) CNTK::DeviceDescriptor::Type;
// %rename (GetId) CNTK::DeviceDescriptor::Id;

%typemap(cscode) CNTK::DeviceDescriptor %{

// Todo: why mapped to uint??
//    public int Id
//    {
//        get { return GetId(); }
//    }

    public DeviceKind Type
    {
        get { return GetDeviceType(); }
    }

    public static DeviceDescriptor CPUDevice
    {
        get { return GetCPUDevice(); }
    }

    public static DeviceDescriptor DefaultDevice
    {
        get { return GetDefaultDevice(); }
    }

    public static DeviceDescriptor BestDevice
    {
        get { return GetBestDevice(); }
    }

    public static System.Collections.Generic.List<DeviceDescriptor> AllDevices
    {
        get {
            var devices = GetAllDevices();
            var ret = new System.Collections.Generic.List<DeviceDescriptor>(devices.Count);
            foreach (var d in devices)
            {
                ret.Add(d);
            }
            return ret;
        }
    }
%}


%rename (GetOutput) CNTK::Function::Output;
%rename (GetOutputs) CNTK::Function::Outputs;
%rename (GetArguments) CNTK::Function::Arguments;

%typemap(cscode) CNTK::Function %{

    public System.Collections.Generic.List<Variable> Outputs
    {
        get 
        {
            var vars = GetOutputs();
            var ret = new System.Collections.Generic.List<Variable>(vars.Count);
            foreach (var v in vars)
            {
                ret.Add(v);
            }
            return ret;
        }
    }

    public Variable Output
    {
        get { return GetOutput(); }
    }

    public System.Collections.Generic.List<Variable> Arguments
    {
        get 
        {
            var vars = GetArguments();
            var ret = new System.Collections.Generic.List<Variable>(vars.Count);
            foreach (var v in vars)
            {
                ret.Add(v);
            }
            return ret;
        }
    }

    // Todo: do we have a better place to put this function?
    public static Function Combine(System.Collections.Generic.IEnumerable<Variable> outputVariable)
    {
        var varVect = new VariableVector();
        foreach (var v in outputVariable)
        {
            varVect.Add(v);
        }
        return CSharpBindings.Combine(varVect);        
    }
%}

%rename (GetShape) CNTK::Variable::Shape;
%rename (GetName) CNTK::Variable::Name;

%typemap(cscode) CNTK::Variable %{

    public NDShape Shape
    {
        get { return GetShape(); }
    }

    public string Name
    {
        get { return GetName(); }
    }
%}

%rename (GetDimensions) CNTK::NDShape::Dimensions;
%rename (GetRank) CNTK::NDShape::Rank;
%rename (GetTotalSize) CNTK::NDShape::TotalSize;
%rename (AreEqualShape) operator==(const NDShape& first, const NDShape& second);

%typemap(cscode) CNTK::NDShape %{
    public uint Rank
    {
        get { return GetRank(); }
    }

    public System.Collections.Generic.List<long> Dimensions
    {
        get 
        { 
            var ret = new System.Collections.Generic.List<long>((int)GetRank());
            foreach (var dim in GetDimensions())
            {
                ret.Add(dim);
            }
            return ret;
        }
    }

    public uint TotalSize
    {
        get { return GetTotalSize(); }
    }

    public uint this[int key]
    {
        get { return GetDimensionSize((uint)key); }
    }

    public override bool Equals(System.Object obj)
    {
        // If parameter is null return false.
        if (obj == null)
        {
            return false;
        }

        // If parameter cannot be cast to Point return false.
        NDShape p = obj as NDShape;
        if ((System.Object)p == null)
        {
            return false;
        }

        // Return true if the fields match:
        return CSharpBindings.AreEqualShape(this, p);
    }

    public bool Equals(NDShape p)
    {
        // If parameter is null return false:
        if ((object)p == null)
        {
            return false;
        }

        // Return true if the fields match:
        return CSharpBindings.AreEqualShape(this, p);
    }

    public static bool operator ==(NDShape first, NDShape second)
    {
        // If both are null, or both are same instance, return true.
        if (System.Object.ReferenceEquals(first, second))
        {
            return true;
        }

        // If one is null, but not both, return false.
        if (((object)first == null) || ((object)second == null))
        {
            return false;
        }

        // Return true if the fields match:
        return CSharpBindings.AreEqualShape(first, second);
    }

    public static bool operator !=(NDShape first, NDShape second)
    {
        return !(first == second);
    }

    public override int GetHashCode()
    {
        //Todo: another hash function??
        return this.GetDimensions().GetHashCode();
    }

%}

%typemap(cscode) CNTK::Value %{

    public static Value Create<T>(NDShape shape, System.Collections.Generic.List<System.Collections.Generic.List<T>> sequences, DeviceDescriptor computeDevice)
    {
        var dim = shape.TotalSize;

        if (typeof(T).Equals(typeof(float)))
        {
            var inputSeqVector = new FloatVectorVector();
            foreach (var seq in sequences)
            {
                if (seq.Count % dim != 0)
                {
                    throw new System.ArgumentException("the number of data in sequences does not match the input dimension");
                }
                var samples = new FloatVector(seq);
                inputSeqVector.Add(samples);
            }
            return Value.CreateDenseFloat(shape, inputSeqVector, computeDevice);
        }
        else if (typeof(T).Equals(typeof(double)))
        {
            var inputSeqVector = new DoubleVectorVector();
            foreach (var seq in sequences)
            {
                if (seq.Count % dim != 0)
                {
                    throw new System.ArgumentException("the number of data in sequences does not match the input dimension");
                }
                var samples = new DoubleVector(seq);
                inputSeqVector.Add(samples);
            }
            return Value.CreateDenseDouble(shape, inputSeqVector, computeDevice);
        }
        else
        {
            throw new System.ArgumentException("The data type " + typeof(T).ToString() + " is not supported. Only float or double is supported by CNTK.");
        }
    }

    public static Value Create<T>(long vacabSize, System.Collections.Generic.List<System.Collections.Generic.List<long>> oneHotIndex, DeviceDescriptor computeDevice)
    {
        throw new System.NotImplementedException("Not implemented");
    }

    // Create Value based on sparse input
    // Todo: could this be a extension to Value class??
    // Todo: use Variable instead of varName. VarName as extension method
    public static Value Create<T>(NDShape shape, System.Collections.Generic.List<System.Collections.Generic.List<T>> data, System.Collections.Generic.List<System.Collections.Generic.List<long>> indexes, System.Collections.Generic.List<System.Collections.Generic.List<long>> nnzCounts, DeviceDescriptor computeDevice)
    {
        throw new System.NotImplementedException("Not implemented");
    }
%}


%include "CNTKLibraryInternals.h"
%include "CNTKLibrary.h"

//
// Value
//
%extend CNTK::Value {
    static CNTK::ValuePtr CNTK::Value::CreateDenseFloat(const CNTK::NDShape& sampleShape, const std::vector<std::vector<float>>& sequences, 
        const CNTK::DeviceDescriptor& device, bool readOnly = false) {
        return CNTK::Value::Create<float>(sampleShape, sequences, device, readOnly);
    }

    static CNTK::ValuePtr CNTK::Value::CreateDenseDouble(const CNTK::NDShape& sampleShape, const std::vector<std::vector<double>>& sequences, 
        const CNTK::DeviceDescriptor& device, bool readOnly = false) {
        return CNTK::Value::Create<double>(sampleShape, sequences, device, readOnly);
    }

    static CNTK::ValuePtr CNTK::Value::CreateOneHotFloat(size_t vocabularySize, const std::vector<std::vector<size_t>>& oneHotSequences, 
        const CNTK::DeviceDescriptor& device, bool readOnly = false) {
        return CNTK::Value::Create<float>(vocabularySize, oneHotSequences, device, readOnly);
    }

    static CNTK::ValuePtr CNTK::Value::CreateOneHotDouble(size_t vocabularySize, const std::vector<std::vector<size_t>>& oneHotSequences, 
        const CNTK::DeviceDescriptor& device, bool readOnly = false) {
        return CNTK::Value::Create<double>(vocabularySize, oneHotSequences, device, readOnly);
    }
}


//
// NDArryView
//
%extend CNTK::NDArrayView {
    NDArrayView(const NDShape& viewShape, float *dataBuffer, size_t numBufferElements, const DeviceDescriptor& device, bool readOnly = false)
    {
        return new CNTK::NDArrayView(CNTK::DataType::Float, viewShape, dataBuffer, numBufferElements * sizeof(float), device, readOnly);
    }

    NDArrayView(const NDShape& viewShape, double *dataBuffer, size_t numBufferElements, const DeviceDescriptor& device, bool readOnly = false)
    {
        return new CNTK::NDArrayView(CNTK::DataType::Double, viewShape, dataBuffer, numBufferElements * sizeof(double), device, readOnly);
    }
}

// 
// NDShape
//
%extend CNTK::NDShape {
    size_t GetDimensionSize(size_t axisId)
    {
        return (*self)[axisId];
    }
}


